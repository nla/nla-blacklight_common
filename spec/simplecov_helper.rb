require "simplecov"
require "simplecov-html"
require "simplecov_json_formatter"

SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::JSONFormatter
])

SimpleCov.start "rails" do
  # enable_coverage :branch

  add_filter do |source_file|
    source_file.lines.count < 10
  end

  add_filter "lib/nla/blacklight_common/engine.rb"
  add_filter "lib/generators/"
  add_filter "lib/tasks/"

  add_filter "app/controllers/users/omniauth_callbacks_controller.rb"

  # these will be removed soon
  add_filter "lib/devise/models/getalibrarycard_authenticatable.rb"
  add_filter "lib/devise/strategies/getalibrarycard_authenticatable.rb"
end
