require "rails_helper"

RSpec.describe Email2faService do
  subject(:service) { described_class.new }

  describe "#email_2fa_status" do
    context "when user has 2FA enabled" do
      before do
        WebMock.stub_request(:get, /catservices.test\/catalogue-services\/patron\/2fa\/email\/(.*)/)
          .to_return(status: 200, body: {status: true}.to_json, headers: {"Content-Type" => "application/json"})
      end

      it "returns true" do
        expect(service.email_2fa_status(SecureRandom.uuid)).to be true
      end
    end

    context "when user has 2FA disabled" do
      before do
        WebMock.stub_request(:get, /catservices.test\/catalogue-services\/patron\/2fa\/email\/(.*)/)
          .to_return(status: 200, body: {status: false}.to_json, headers: {"Content-Type" => "application/json"})
      end

      it "returns false" do
        expect(service.email_2fa_status(SecureRandom.uuid)).to be false
      end
    end

    context "when failed to retrieve 2FA status" do
      before do
        allow(Rails.logger).to receive(:error)

        WebMock.stub_request(:get, /catservices.test\/catalogue-services\/patron\/2fa\/email\/(.*)/)
          .to_return(status: 500, body: nil, headers: {"Content-Type" => "application/json"})
      end

      it "logs an error" do
        service.email_2fa_status(SecureRandom.uuid)
        expect(Rails.logger).to have_received(:error).with(/Failed to retrieve two-factor authentication status for/)
      end

      it "returns false" do
        expect(service.email_2fa_status(SecureRandom.uuid)).to be false
      end
    end

    context "when failed to connect to web service" do
      before do
        WebMock.stub_request(:get, /catservices.test\/catalogue-services\/patron\/2fa\/email\/(.*)/)
          .to_raise(StandardError)
      end

      it "raises an Email2faDetailsError" do
        expect { service.email_2fa_status(SecureRandom.uuid) }.to raise_error Email2faDetailsError
      end
    end
  end

  describe "#disable_email_2fa" do
    context "when successfully disabling 2FA" do
      before do
        WebMock.stub_request(:delete, /catservices.test\/catalogue-services\/patron\/2fa\/email\/(.*)/)
          .to_return(status: 200, body: nil, headers: {"Content-Type" => "application/json"})
      end

      it "returns nil" do
        expect(service.disable_email_2fa(SecureRandom.uuid)).to be_nil
      end
    end

    context "when failed to disable 2FA" do
      before do
        allow(Rails.logger).to receive(:error)

        WebMock.stub_request(:delete, /catservices.test\/catalogue-services\/patron\/2fa\/email\/(.*)/)
          .to_return(status: 500, body: nil, headers: {"Content-Type" => "application/json"})
      end

      it "logs an error" do
        service.disable_email_2fa(SecureRandom.uuid)
        expect(Rails.logger).to have_received(:error).with(/Failed to disable two-factor authentication for/)
      end
    end

    context "when failed to connect to web service" do
      before do
        WebMock.stub_request(:delete, /catservices.test\/catalogue-services\/patron\/2fa\/email\/(.*)/)
          .to_raise(StandardError)
      end

      it "raises an Email2faDetailsError" do
        expect { service.disable_email_2fa(SecureRandom.uuid) }.to raise_error Email2faDetailsError
      end
    end
  end
end
