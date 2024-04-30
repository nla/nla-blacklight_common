# frozen_string_literal: true

class Email2faAlertComponent < ViewComponent::Base
  def initialize(status, enable_link, help_link, session_flag)
    @status = status
    @enable_link = enable_link
    @help_link = help_link
    @session_flag = session_flag
  end

  def render?
    @status == false
  end

  def enable_link
    link_to I18n.t("account.settings.email_2fa.alert.enable_link_text"), @enable_link, data: {turbo: false}, target: "_top"
  end

  def help_link
    link_to I18n.t("account.settings.email_2fa.alert.help_link_text"), @help_link, data: {turbo: false}, target: "_top"
  end
end
