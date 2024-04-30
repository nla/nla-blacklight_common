# frozen_string_literal: true

class Email2faDetailsError < StandardError; end

class Email2faService
  def email_2fa_status(user_id)
    conn = setup_connection

    res = conn.get("/catalogue-services/patron/2fa/email/#{user_id}")
    if res.status != 200
      message = "Failed to retrieve two-factor authentication status for #{user_id}"
      Rails.logger.error message
    end
    res.body["status"]
  rescue => e
    Rails.logger.error "email_2fa_status - Failed to connect catalogue-service: #{e.message}"
    raise Email2faDetailsError.new("Failed to retrieve details for #{user_id}")
  end

  def disable_email_2fa(user_id)
    conn = setup_connection

    res = conn.delete("/catalogue-services/patron/2fa/email/#{user_id}")
    if res.status != 200
      Rails.logger.error "Failed to disable two-factor authentication for #{user_id}"
    end
  rescue => e
    Rails.logger.error "disable_email_2fa - Failed to connect catalogue-service: #{e.message}"
    raise Email2faDetailsError.new("Failed to update details for #{user_id}")
  end

  private

  def setup_connection
    Faraday.new(url: ENV["CATALOGUE_SERVICES_API_BASE_URL"]) do |f|
      f.response :json
    end
  end
end
