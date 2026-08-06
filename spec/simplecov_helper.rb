require "simplecov"
require "simplecov-html"
require "simplecov_json_formatter"

SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::JSONFormatter
])

SimpleCov.start "rails" do
  # enable_coverage :branch

  skip do |source_file|
    source_file.lines.count < 10
  end

  skip "lib/nla/blacklight_common/engine.rb"
  skip "lib/generators/"
  skip "lib/tasks/"

  skip "app/controllers/users/omniauth_callbacks_controller.rb"

  # these will be removed soon
  skip "lib/devise/models/getalibrarycard_authenticatable.rb"
  skip "lib/devise/strategies/getalibrarycard_authenticatable.rb"
  skip "lib/devise/models/user_reg_authenticatable.rb"
  skip "lib/devise/strategies/user_reg_authenticatable.rb"
end
