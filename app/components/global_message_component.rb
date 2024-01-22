# frozen_string_literal: true

require "faraday"

class GlobalMessageComponent < ViewComponent::Base
  def initialize
    @messages ||= fetch_messages
  end

  def render?
    @messages.present?
  end

  private

  def fetch_messages
    Rails.cache.fetch("global_messages", expires_in: 1.hour) do
      uri = URI.parse(ENV["GLOBAL_MESSAGE_URL"])
      conn = Faraday.new(url: "#{uri.scheme}://#{uri.host}#{uri.port.present? ? ":#{uri.port}" : ""}")
      response = conn.get uri.path.to_s
      if response.status == 200 && response.body.present?
        JSON.parse(response.body)
      end
    end
  rescue => e
    Rails.logger.error "Error fetching global messages: #{e.message}"
    nil
  end
end
