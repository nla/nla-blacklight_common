module Nla
  module BlacklightCommon
    module Routes
      class Email2fa
        def initialize(defaults = {})
          @defaults = defaults
        end

        def call(mapper, options = {})
          @defaults.merge(options)

          mapper.scope path: "/email_2fa", as: "email_2fa" do
            mapper.get "/enable", to: "email2fa#enable", as: "enable"
            mapper.get "/disable", to: "email2fa#disable", as: "disable"

            mapper.scope path: "/alert", as: "alert" do
              mapper.get "/", to: "email2fa_alert#show"
              mapper.get "/dismiss", to: "email2fa_alert#dismiss"
            end
          end
        end
      end
    end
  end
end
