require "simplecov-html"
require "simplecov_json_formatter"

SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::JSONFormatter
])

SimpleCov.start "rails" do
  enable_coverage :branch

  add_filter do |source_file|
    source_file.lines.count < 10
  end

  add_filter "lib/catalogue/patrons/engine.rb"

  add_filter "app/controllers/users/omniauth_callbacks_controller.rb"

  # Filter out hack around Turbo + Devise issue
  add_filter "app/controllers/turbo_devise_controller.rb"
end
