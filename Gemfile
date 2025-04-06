source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# placeholder: rails 7.2.2.1

# Specify your gem's dependencies in nla-blacklight_common.gemspec.
gemspec

gem "mysql2"

gem "sprockets-rails"

gem "puma", "~> 6.6"

gem "jwt", "~> 2.9"

gem "strong_migrations", "~> 2.2"

gem "fuubar"

group :development, :test do
  # All runtime config comes from the UNIX environment
  # but we use dotenv to store that in files for development and testing
  gem "dotenv"

  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "standard", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-capybara", require: false
  gem "rubocop-factory_bot", require: false

  gem "rspec-rails", "~> 6.1"
  gem "shoulda-matchers"
  gem "factory_bot_rails"
  gem "faker"

  gem "rails-ujs"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "rails-controller-testing"
  gem "webmock"

  gem "simplecov"
  gem "simplecov-json"
end
