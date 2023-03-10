# frozen_string_literal: true

module Nla
  module Blacklight
    module Whitelist
      def in_local_subnet?(request)
        client_in_subnets(request, local_subnets)
      end

      def in_staff_subnet?(request)
        client_in_subnets(request, staff_subnets)
      end

      private

      def local_subnets
        @local_subnets ||= ENV["LOCAL_SUBNET"].split(",")
      end

      def staff_subnets
        @staff_subnets ||= ENV["STAFF_SUBNET"].split(",")
      end

      def client_in_subnets(request, subnets)
        subnets.each do |subnet|
          if client_in_subnet(request, subnet)
            return true
          end
        end

        false
      end

      def get_client_ip(request)
        client_ip = request.remote_ip

        # Theoretically this shouldn't happen, because #remote_ip should get the real IP address,
        # but I've carried it over from the original VuFind code.
        if client_ip.include? ","
          client_ip = client_ip.split(",")
          client_ip = client_ip.last
        end

        client_ip
      end

      def client_in_subnet(request, subnet)
        client_ip = get_client_ip request

        client_ranges = client_ip.split(".")
        subnet_ranges = subnet.split(".")

        match = false
        4.times { |i|
          if subnet_ranges[i] == "0" || client_ranges[i] == subnet_ranges[i]
            match = true
          else
            return false
          end
        }

        match
      end
    end
  end
end
