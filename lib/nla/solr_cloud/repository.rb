# frozen_string_literal: true

require "zk"
require "rsolr"
require "blacklight"
require "faraday"

module Nla
  module SolrCloud
    class NotEnoughNodes < RuntimeError
      def to_s
        "There are not enough nodes to handle the request."
      end
    end

    class Repository < Blacklight::Solr::Repository
      include MonitorMixin

      ZNODE_LIVE_NODES = "/live_nodes"
      MAX_RETRIES = 3
      ACTIVE = "active"

      def find(id, params = {})
        doc_params = params.reverse_merge(blacklight_config.default_document_solr_params)
          .reverse_merge(qt: blacklight_config.document_solr_request_handler)
          .merge(blacklight_config.document_unique_id_param => "id:#{id}")

        solr_response = send_and_receive blacklight_config.document_solr_path || blacklight_config.solr_path, doc_params
        raise Blacklight::Exceptions::RecordNotFound if solr_response&.documents&.empty?

        solr_response
      end

      private

      def build_connection
        make_connection(0)
      end

      def make_connection(tries)
        synchronize do
          url = ZK.open(connection_config[:zk_host], {chroot: :do_nothing}) do |zk|
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
            raise Nla::SolrCloud::NotEnoughNodes unless url
            url
          end

          begin
            client = ::RSolr.connect(connection_config.merge(adapter: connection_config[:http_adapter], url: url, timeout: 30, open_timeout: 30))
            client.presence
          rescue
            tries += 1
            (tries > MAX_RETRIES) ? raise(Nla::SolrCloud::NotEnoughNodes) : make_connection(tries)
          end
        end
      end
    end
  end
end
