# frozen_string_literal: true

module BentoSessionResetConcern
  extend ActiveSupport::Concern

  included do
    before_action :reset_search_session, only: [:show]

    def reset_search_session
      referrer = request.referrer
      if referrer.present? && referrer.include?("/search?q=")
        Rails.logger.info "Referrer is bento, resetting search session."
        session[:search] = {}
      end
    end
  end
end
