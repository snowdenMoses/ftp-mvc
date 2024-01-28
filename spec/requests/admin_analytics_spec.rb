require 'rails_helper'

RSpec.describe "AdminAnalytics", type: :request do
  let!(:url_resource) {"/admin_analytics"}
  let!(:user) {FactoryBot.create(:user)}
  describe "GET /index" do

    it "returns http success" do
      sign_in(user)
      get "#{url_resource}"
      expect(response).to have_http_status(:success)
    end

    it "redirect user if not logged in" do
      get "#{url_resource}"
      expect(response).to have_http_status(302)
    end
  end
end
