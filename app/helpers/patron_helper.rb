# frozen_string_literal: true

module PatronHelper
  def user_location
    Whitelist.instance.location request
  end

  def user_type
    Whitelist.instance.user_type request
  end
end
