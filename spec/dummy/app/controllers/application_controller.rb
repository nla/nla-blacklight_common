class ApplicationController < ActionController::Base
  # Attempt to find the mapped route for devise based on request path

  include AuthSessionConcern
end
