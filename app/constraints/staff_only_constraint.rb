# frozen_string_literal: true

class StaffOnlyConstraint
  def matches?(request)
    location = Whitelist.instance.location request
    location == :staff || Rails.env.development?
  end
end
