# frozen_string_literal: true

require "nla/blacklight/user_location"
require "nla/blacklight/user_type"

module PatronHelper
  def user_location
    Nla::Blacklight::UserLocation.instance.location request
  end

  def user_type
    Nla::Blacklight::UserType.instance.type request
  end
end
