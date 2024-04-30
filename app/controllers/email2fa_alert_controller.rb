class Email2faAlertController < ApplicationController
  def show
    if current_user
      @status = Email2faService.new.email_2fa_status(current_user.uid)
    end
    @enable_link = email_2fa_enable_url
    @help_link = ENV["ABOUT_2FA_URL"]
    @session_flag = session[:email_2fa_flag]
    render layout: false
  end

  def dismiss
    session[:email_2fa_flag] = true
    render "email2fa_alert/show", layout: false
  end
end
