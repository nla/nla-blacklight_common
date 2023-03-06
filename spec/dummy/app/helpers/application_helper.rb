module ApplicationHelper
  # Mock these helpers for Devise
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # this should be implemented in the consuming application's ApplicationHelper
  def in_staff_subnet?
    raise NotImplementedError
  end
end
