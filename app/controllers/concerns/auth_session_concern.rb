# frozen_string_literal: true

module AuthSessionConcern
  extend ActiveSupport::Concern

  def new_session_path(_scope)
    new_user_session_path
  end
end
