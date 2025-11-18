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
    Rails.logger.error "checking local subnet"
    client_in_subnets(request, local_subnets)
  end

  def in_staff_subnet?(request)
    Rails.logger.error "checking staff subnet"
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
    Rails.logger.error "checking client ip: #{client_ip}"
    Rails.logger.error "checking client ip: #{request.keys}"
    Rails.logger.error "checking client ip: #{request.to_s}"


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

  def client_in_subnet(request, subnet)
    client_ip = get_client_ip request

    client_ranges = client_ip.split(".")
    subnet_ranges = subnet.split(".")

    match = false
    4.times { |i|
      Rails.logger.error "Comparing client#{client_ranges[i]}  subnet #{subnet_ranges[i]}  i #{i}"
      if subnet_ranges[i] == "0" || client_ranges[i] == subnet_ranges[i]
        Rails.logger.error "match"
        match = true
      else
        Rails.logger.error "Fail"
        return false
      end
    }

    match
  end
end
