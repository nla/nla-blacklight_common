# frozen_string_literal: true

require "zk"
require "rsolr"
require "blacklight"

require "blacklight/solr_cloud/not_enough_nodes"

module Blacklight
  module SolrCloud
    class Repository < Blacklight::Solr::Repository
      include MonitorMixin

      ZNODE_LIVE_NODES = "/live_nodes"
      MAX_RETRIES = 3
      ACTIVE = "active"

      private

      def build_connection
        make_connection(0)
      end

      def make_connection(tries)
        synchronize do
          connection = ZK.open(connection_config[:zk_host], {chroot: :do_nothing}) do |zk|
            collection_state_json, _stat = zk.get("/collections/#{connection_config[:collection]}/state.json", watch: false)
            collection_state = ::JSON.parse(collection_state_json)[connection_config[:collection]]

            live_nodes = zk.children(ZNODE_LIVE_NODES, watch: false)

            all_nodes = collection_state["shards"].values.map do |shard|
              shard["replicas"].values
            end

            all_urls = []
            all_nodes.flatten&.each do |node|
              next unless live_nodes.include?(node["node_name"]) && node["state"] == ACTIVE
              all_urls << "#{node["base_url"]}/#{connection_config[:collection]}"
            end

            url = all_urls.sample
            raise Blacklight::SolrCloud::NotEnoughNodes unless url

            GC.start

            ::RSolr.connect(connection_config.merge(adapter: connection_config[:http_adapter], url: url, timeout: 30, open_timeout: 30))
          end

          connection.presence
        rescue
          tries += 1
          (tries > MAX_RETRIES) ? raise(Blacklight::SolrCloud::NotEnoughNodes) : make_connection(tries)
        end
      end
    end
  end
end
