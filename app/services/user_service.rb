# frozen_string_literal: true

class AutoRenewError < StandardError; end

class UserService
  def auto_renew(folio_id)
    conn = setup_connection

    res = conn.post("/catalogue-services/folio/user/#{folio_id}/autorenew")
    if res.status == 200 && res.body.present?
      ActiveModel::Type::Boolean.new.cast(res.body["active"])
    else
      Rails.logger.error "Failed to auto renew #{folio_id}"
      raise AutoRenewError.new("Failed to auto renew #{folio_id}")
    end
  rescue => e
    Rails.logger.error "auto_renew - Failed connecting to catalogue-service: #{e.message}"
    raise AutoRenewError.new("Failed to auto renew #{folio_id}")
  end

  private

  def setup_connection
    Faraday.new(url: ENV["CATALOGUE_SERVICES_API_BASE_URL"]) do |f|
      f.response :json
    end
  end
end
