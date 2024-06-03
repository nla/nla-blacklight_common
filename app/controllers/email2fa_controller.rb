# frozen_string_literal: true

class Email2faController < ApplicationController
  before_action :authenticate_user!

  def enable
    url_hash = [
      ENV["KEYCLOAK_URL"],
      ENV["KC_PATRON_REALM"],
      ENV["KC_PATRON_CLIENT"],
      ENV["EMAIL_2FA_REGISTRATION_REDIRECT_URL"],
      ENV["EMAIL_2FA_ACTION"]
    ]
    redirect_to ENV["EMAIL_2FA_REGISTRATION_URL"] % url_hash, allow_other_host: true
  end

  def disable
    Email2faService.new.disable_email_2fa(current_user.uid)
    status = Email2faService.new.email_2fa_status(current_user.uid)
    unless status
      flash.now[:error] = I18n.t("account.settings.update.errors.2fa.failed")
    end
    redirect_to ENV["EMAIL_2FA_REGISTRATION_REDIRECT_URL"]
  end
end
