# frozen_string_literal: true

require "faraday"

class GlobalMessageComponent < ViewComponent::Base
  def initialize(location: nil)
    @messages ||= fetch_messages
    @location = location
  end

  def render?
    @messages.present?
  end

  private

  def fetch_messages
    uri = URI.parse(ENV["GLOBAL_MESSAGE_URL"])
    conn = Faraday.new(url: "#{uri.scheme}://#{uri.host}#{uri.port.present? ? ":#{uri.port}" : ""}")
    response = conn.get uri.path.to_s
    if response.status == 200 && response.body.present?
      JSON.parse(response.body)
    else
      []
    end
  rescue => e
    Rails.logger.error "Error fetching global messages: #{e.message}"
    []
  end
end
