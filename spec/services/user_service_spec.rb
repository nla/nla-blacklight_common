require "rails_helper"

RSpec.describe UserService, type: :request do
  subject(:service) { described_class.new }

  before do
    allow(ENV).to receive(:[]).and_call_original
    allow(ENV).to receive(:[]).with("KC_PATRON_REALM").and_return("patron_realm")
  end

  describe "#auto_renew" do
    context "when unable to auto renew" do
      before do
        WebMock.stub_request(:post, /catservices.test\/catalogue-services\/folio\/user\/(.*)\/autorenew/)
          .with(
            headers: {
              "Accept" => "*/*",
              "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3"
            }
          )
          .to_raise(StandardError)
      end

      it "raises an AutoRenewError" do
        expect { service.auto_renew(SecureRandom.uuid) }.to raise_error AutoRenewError
      end
    end

    context "when catalogue service returns an error" do
      before do
        WebMock.stub_request(:post, /catservices.test\/catalogue-services\/folio\/user\/(.*)\/autorenew/)
          .with(
            headers: {
              "Accept" => "*/*",
              "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3"
            }
          )
          .to_return(status: 403, body: nil, headers: {"Content-Type" => "application/json"})
      end

      it "raises an AutoRenewError" do
        expect { service.auto_renew(SecureRandom.uuid) }.to raise_error AutoRenewError
      end
    end

    context "when user account has not expired" do
      it "returns true" do
        expect(service.auto_renew(SecureRandom.uuid)).to be true
      end
    end

    context "when user account has expired" do
      before do
        WebMock.stub_request(:post, /catservices.test\/catalogue-services\/folio\/user\/(.*)\/autorenew/)
          .with(
            headers: {
              "Accept" => "*/*",
              "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3"
            }
          )
          .to_return(status: 200, body: '{"active": false}', headers: {"Content-Type" => "application/json"})
      end

      it "returns false" do
        expect(service.auto_renew(SecureRandom.uuid)).to be false
      end
    end
  end
end
