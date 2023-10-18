require "webmock/rspec"

# Disables HTTP requests, with the exception of requests to localhost
WebMock.disable_net_connect!(
  allow_localhost: true,
  allow: "chromedriver.storage.googleapis.com"
)

RSpec.configure do |config|
  config.before do
    WebMock.stub_request(:get, /solr:8983/)
      .with(
        headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
          "User-Agent" => "catalogue/#{Nla::BlacklightCommon::VERSION}"
        }
      )
      .to_return(status: 200, body: "", headers: {})

    auth_mock = IO.read("spec/files/auth/authenticate.xml")

    WebMock.stub_request(:post, /.nla.gov.au\/getalibrarycard\/authenticate.xml/)
      .with(
        headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
          "Content-Length" => "0",
          "User-Agent" => "catalogue/#{Nla::BlacklightCommon::VERSION}"
        }
      )
      .to_return(status: 200, body: auth_mock, headers: {})

    details_mock = IO.read("spec/files/auth/user_details.xml")

    WebMock.stub_request(:get, /.nla.gov.au\/getalibrarycard\/patrons\/details\/([0-9]*).xml/)
      .with(
        headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
          "User-Agent" => "catalogue/#{Nla::BlacklightCommon::VERSION}"
        }
      )
      .to_return(status: 200, body: details_mock, headers: {})

    success_auth_mock = IO.read("spec/files/auth/user_reg_success.json")

    WebMock.stub_request(:post, /auth-test.nla.gov.au\/authenticate/)
      .with(
        body: "{\"barcode\":\"bltest\",\"lastName\":\"test\"}",
        headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
          "Content-Type" => "application/json",
          "User-Agent" => "catalogue/#{Nla::BlacklightCommon::VERSION}"
        }
      )
      .to_return(status: 200, body: success_auth_mock, headers: {})

    inactive_auth_mock = IO.read("spec/files/auth/user_reg_success_inactive.json")

    WebMock.stub_request(:post, /auth-test.nla.gov.au\/authenticate/)
      .with(
        body: "{\"barcode\":\"bltest\",\"lastName\":\"blacklight\"}",
        headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
          "Content-Type" => "application/json",
          "User-Agent" => "catalogue/#{Nla::BlacklightCommon::VERSION}"
        }
      )
      .to_return(status: 200, body: inactive_auth_mock, headers: {})

    failed_auth_mock = IO.read("spec/files/auth/user_reg_failure.json")

    WebMock.stub_request(:post, /auth-test.nla.gov.au\/authenticate/)
      .with(
        body: "{\"barcode\":\"0000\",\"lastName\":\"failure\"}",
        headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
          "Content-Type" => "application/json",
          "User-Agent" => "catalogue/#{Nla::BlacklightCommon::VERSION}"
        }
      )
      .to_return(status: 404, body: failed_auth_mock, headers: {})

    single_message_mock = IO.read("spec/files/global_messages/single_message.json")

    WebMock.stub_request(:get, /test.nla.gov.au\/catalogue-message\/(1|1234)/)
      .with(
        headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3"
        }
      )
      .to_return(status: 200, body: single_message_mock, headers: {"Content-Type" => "application/json"})

    multi_message_mock = IO.read("spec/files/global_messages/multiple_messages.json")

    WebMock.stub_request(:get, /test.nla.gov.au\/catalogue-message\/2/)
      .with(
        headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3"
        }
      )
      .to_return(status: 200, body: multi_message_mock, headers: {"Content-Type" => "application/json"})

    WebMock.stub_request(:post, /catservices.test\/catalogue-services\/folio\/user\/(.*)\/autorenew/)
      .with(
        headers: {
          "Accept" => "*/*",
          "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3"
        }
      )
      .to_return(status: 200, body: '{"active": true}', headers: {"Content-Type" => "application/json"})
  end
end
