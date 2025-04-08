require_relative "lib/nla/blacklight_common/version"

Gem::Specification.new do |spec|
  spec.name = "nla-blacklight_common"
  spec.version = Nla::BlacklightCommon::VERSION
  spec.authors = ["Yetrina Battad"]
  spec.email = ["hello@yetti.io"]

  spec.summary = "Common functionality for Blacklight/ArcLight"
  spec.homepage = "https://github.com/nla/nla-blacklight_common"
  spec.license = "Apache-2.0"
  spec.required_ruby_version = ">= 3.3.2"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/nla/nla-blacklight_common/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 8", "< 9.0"

  # blacklight
  spec.add_dependency "blacklight", ">= 8.0.0", "< 9"
  spec.add_dependency "rsolr", ">= 1.0", "< 3"
  spec.add_dependency "zk", "~> 1.10"

  # Brakeman analyzes our code for security vulnerabilities
  spec.add_dependency "brakeman"

  # bundler-audit checks our dependencies for vulnerabilities
  spec.add_dependency "bundler-audit"

  # authentication and sessions
  spec.add_dependency "activerecord-session_store", "~> 2.0"
  spec.add_dependency "devise"
  spec.add_dependency "omniauth-keycloak", "~> 1.4"
  spec.add_dependency "omniauth-rails_csrf_protection", "~> 1.0"

  # utilities
  spec.add_dependency "annotaterb"

  # connection pooling
  spec.add_dependency "connection_pool"
end
