# frozen_string_literal: true

require "spec_helper"

require "zk"
require "nla/solr_cloud/repository"

RSpec.describe Nla::SolrCloud::Repository, type: :api do
  subject(:repository) { described_class.new blacklight_config }

  let(:connection_config) do
    {
      adapter: "solr_cloud",
      url: "http://127.0.0.1:8983/solr/blacklight",
      zk_host: "localhost:2181",
      collection: "collection1"
    }
  end

  let(:blacklight_config) do
    Blacklight::OpenStructWithHashAccess.new(connection_config: connection_config)
  end

  let(:zk_in_solr) { ZK.new }

  let(:client) { repository.connection }

  let(:uri) { client.instance_variable_get(:@uri) }

  before do
    delete_with_children(zk_in_solr, "/live_nodes")
    delete_with_children(zk_in_solr, "/collections")
    wait_until(10) do
      !zk_in_solr.exists?("/live_nodes")
    end
    wait_until(10) do
      !zk_in_solr.exists?("/collections")
    end
    zk_in_solr.create("/live_nodes")
    zk_in_solr.create("/collections")

    %w[192.168.1.21:8983_solr 192.168.1.22:8983_solr 192.168.1.23:8983_solr 192.168.1.24:8983_solr].each do |node|
      zk_in_solr.create("/live_nodes/#{node}", "", mode: :ephemeral)
    end

    zk_in_solr.create("/collections/collection1")
    json = IO.read("spec/files/solr_repository/collection1_all_nodes_alive.json")
    zk_in_solr.create("/collections/collection1/state.json",
      json,
      mode: :ephemeral)
  end

  after do
    zk_in_solr&.close
  end

  it "has a version number" do
    expect(Nla::BlacklightCommon::VERSION).not_to be_nil
  end

  it "configures the RSolr client with one of the active nodes in the select request" do
    expect(uri.host).to be_one_of(%w[192.168.1.21 192.168.1.22 192.168.1.23 192.168.1.24])
    expect(uri.path).to eq("/solr/collection1/")
  end

  it "raises an exception when no nodes are available" do
    zk_in_solr.set("/collections/collection1/state.json",
      IO.read("spec/files/solr_repository/collection1_all_nodes_down.json"))
    expect do
      repository.connection
    end.to raise_error(Nla::SolrCloud::NotEnoughNodes, /There are not enough nodes to handle the request./)
  end

  it "chooses another node when leader node is down" do
    zk_in_solr.set("/collections/collection1/state.json",
      IO.read("spec/files/solr_repository/collection1_leader_down.json"))

    expect(uri.host).to be_one_of(%w[192.168.1.21 192.168.1.23 192.168.1.24])
    expect(uri.path).to eq("/solr/collection1/")
  end

  it "chooses another node when replica node is down" do
    zk_in_solr.set("/collections/collection1/state.json",
      IO.read("spec/files/solr_repository/collection1_replica_down.json"))

    expect(uri.host).to be_one_of(%w[192.168.1.22 192.168.1.23 192.168.1.24])
    expect(uri.path).to eq("/solr/collection1/")
  end
end
