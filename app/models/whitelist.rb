# frozen_string_literal: true

class Whitelist
  include Singleton

  def location(request)
    if in_local_subnet? request
      :onsite
    elsif in_staff_subnet? request
      :staff
    else
      :offsite
    end
  end

  def user_type(request)
    if in_local_subnet? request
      :local
    elsif in_staff_subnet? request
      :staff
    else
      :external
    end
  end

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
    client_ip = get_client_ip request

    subnets.any? do |subnet|
      IPAddr.new(subnet).include?(client_ip)
    end
  end

  def get_client_ip(request)
    client_ip = request.remote_ip

    # Theoretically this shouldn't happen, because #remote_ip should get the real IP address,
    # but I've carried it over from the original VuFind code.
    # :nocov:
    if client_ip.include? ","
      client_ip = client_ip.split(",")
      client_ip = client_ip.last
    end
    # :nocov:

    client_ip
  end
end
