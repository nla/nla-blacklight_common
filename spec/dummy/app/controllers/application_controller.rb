class ApplicationController < ActionController::Base
  # Attempt to find the mapped route for devise based on request path

  if ENV["KC_PATRON_REALM"]
    include AuthSessionConcern
  end
end
