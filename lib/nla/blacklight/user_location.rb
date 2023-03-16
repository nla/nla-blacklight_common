# frozen_string_literal: true

require "singleton"
require "nla/blacklight/whitelist"

module Nla
  module Blacklight
    class UserLocation
      include Singleton
      include ::Nla::Blacklight::Whitelist

      def location(request)
        if in_local_subnet? request
          :onsite
        elsif in_staff_subnet? request
          :staff
        else
          :offsite
        end
      end
    end
  end
end
