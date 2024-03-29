require 'rails_helper'

RSpec.describe "UserRegistraions", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/user_registraions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/user_registraions/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/user_registraions/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/user_registraions/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
