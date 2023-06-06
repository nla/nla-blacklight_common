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

  spec.add_dependency "rails", "~> 7.0.4"

  # All runtime config comes from the UNIX environment
  # but we use dotenv to store that in files for development and testing
  spec.add_dependency "dotenv-rails"

  # Brakeman analyzes our code for security vulnerabilities
  spec.add_dependency "brakeman"

  # bundler-audit checks our dependencies for vulnerabilities
  spec.add_dependency "bundler-audit"

  spec.add_dependency "activerecord-session_store", "~> 2.0"
  spec.add_dependency "rufus-scheduler", "~> 3.8"
  spec.add_dependency "devise"
  spec.add_dependency "omniauth-keycloak", "~> 1.4"
  spec.add_dependency "omniauth-rails_csrf_protection", "~> 1.0"

  spec.add_dependency "flipper"
  spec.add_dependency "flipper-redis"
  spec.add_dependency "flipper-ui"

  spec.add_development_dependency "annotaterb"
end
