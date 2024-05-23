# frozen_string_literal: true

require "rails_helper"

RSpec.describe GlobalMessageComponent, type: :component do
  before do
    new_env = ENV.to_hash
    stub_const("ENV", new_env.merge("GLOBAL_MESSAGE_URL" => "http://test.nla.gov.au/catalogue-message/1"))
  end

  it "renders a message" do
    render_inline(described_class.new)

    expect(page).to have_css("div.alert")
    expect(page).to have_content("Blacklight beta message")
  end

  context "when there are multiple messages" do
    before do
      new_env = ENV.to_hash
      stub_const("ENV", new_env.merge("GLOBAL_MESSAGE_URL" => "http://test.nla.gov.au/catalogue-message/2"))
    end

    it "renders multiple messages" do
      render_inline(described_class.new)

      expect(page).to have_css("div.alert", count: 2)
      expect(page).to have_content("Blacklight beta message")
      expect(page).to have_content("Blacklight beta message 2")
    end
  end

  context "when unable to fetch message" do
    before do
      WebMock.stub_request(:get, /test.nla.gov.au\/catalogue-message\/1/)
        .with(
          headers: {
            "Accept" => "*/*",
            "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3"
          }
        )
        .to_raise(StandardError)
    end

    it "returns nil" do
      render_inline(described_class.new)

      expect(page).to have_no_css("div.alert")
    end
  end
end
