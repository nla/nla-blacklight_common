# frozen_string_literal: true

require "rails_helper"

RSpec.describe BentoSessionResetConcern do
  controller(ApplicationController) do
    # rubocop:disable RSpec/DescribedClass
    include BentoSessionResetConcern
    # rubocop:enable RSpec/DescribedClass

    def show
      render plain: "OK"
    end
  end

  before do
    routes.draw { get "show" => "anonymous#show" }
  end

  describe "#reset_search_session" do
    context "when referrer is a bento search" do
      before do
        session[:search] = {"id" => "13", "counter" => "1", "per_page" => nil, "document_id" => "1751020", "total" => 51591}

        request.env["HTTP_REFERER"] = "https://test.nla.gov.au/search?q=foo"
        get :show
      end

      it "resets the session" do
        expect(session[:search]).to eq({})
      end
    end

    context "when referrer is not a bento search" do
      before do
        session[:search] = {"id" => "13", "counter" => "1", "per_page" => nil, "document_id" => "1751020", "total" => 51591}

        request.env["HTTP_REFERER"] = "https://test.nla.gov.au/catalog/1234"
        get :show
      end

      it "does not reset the session" do
        expect(session[:search]).not_to eq({})
      end
    end
  end
end
