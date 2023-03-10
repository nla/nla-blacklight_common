# frozen_string_literal: true

require "singleton"
require_relative "whitelist"

module Nla
  module Blacklight
    class UserType
      include Singleton
      include Whitelist

      def type(request)
        if in_local_subnet? request
          :local
        elsif in_staff_subnet? request
          :staff
        else
          :external
        end
      end
    end
  end
end
