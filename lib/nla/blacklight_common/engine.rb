module Nla
  module BlacklightCommon
    require "blacklight"
    require "activerecord/session_store"
    require "devise"
    require "omniauth-keycloak"
    require "omniauth/rails_csrf_protection"
    require "connection_pool"
    require "nla/blacklight_common"

    class Engine < ::Rails::Engine
      if %w[development test].include? ENV["RAILS_ENV"]
        require "factory_bot_rails"
        require "dotenv/load"
      end

      if defined?(FactoryBotRails)
        config.factory_bot.definition_file_paths +=
          [File.expand_path("#{root}/spec/factories", __FILE__)]
      end

      config.generators.options do |g|
        g.test_framework :rspec
        g.fixture_replacement :factory_bot
      end
    end
  end
end
