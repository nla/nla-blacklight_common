require_relative "lib/catalogue/patrons/version"

ruby_version = File.read(File.join(__dir__, ".ruby-version"))

Gem::Specification.new do |spec|
  spec.name = "catalogue-patrons"
  spec.version = Catalogue::Patrons::VERSION
  spec.authors = ["Yetrina Battad"]
  spec.email = ["hello@yetti.io"]

  spec.summary = "Common user authentication and patron functions for Blacklight/ArcLight"
  spec.homepage = "https://github.com/nla/nla-patrons"
  spec.license = "Apache-2.0"
  spec.required_ruby_version = ">= #{ruby_version}"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/nla/nla-patrons/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.4"

  spec.add_development_dependency "blacklight", "~> 7.32"

  spec.add_development_dependency "standard"
  spec.add_development_dependency "rubocop-rails"
  spec.add_development_dependency "rubocop-rspec"

  spec.add_development_dependency "rspec-rails", "~> 6.0.0"
  spec.add_development_dependency "shoulda-matchers"
  spec.add_development_dependency "factory_bot_rails"
  spec.add_development_dependency "faker"
end
