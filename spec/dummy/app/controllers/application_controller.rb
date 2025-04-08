class ApplicationController < ActionController::Base
  protect_from_forgery
  # Attempt to find the mapped route for devise based on request path

  include AuthSessionConcern
end
