# frozen_string_literal: true

require "simplecov"

module Helpers
  def delete_with_children(zk, path)
    zk.children(path).each do |node|
      delete_with_children(zk, File.join(path, node))
    end
    zk.delete(path)
  rescue ZK::Exceptions::NoNode
    # don't care if it already exists or not.
  end

  def wait_until(timeout = 10)
    started_on = Time.current
    result = false
    loop do
      result = yield
      break if result || started_on < timeout.second.ago
      Thread.pass
    end
    raise "Timed out" unless result
  end

  def load_marc_from_file(id)
    IO.read("spec/files/marc/#{id}.marcxml")
  end
end

RSpec.configure do |config|
  config.include Helpers

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
    c.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

RSpec::Matchers.define :be_one_of do |expected|
  match do |actual|
    expected.include?(actual)
  end
end

RSpec::Matchers.define :become_soon do |expected|
  match do |actual|
    wait_until do
      actual.call == expected
    end
  rescue
    false
  else
    true
  end

  def supports_block_expectations?
    true
  end
end
