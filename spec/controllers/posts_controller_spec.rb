require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET #user_id:" do
    it "returns http success" do
      get :user_id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #integer" do
    it "returns http success" do
      get :integer
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #title:string" do
    it "returns http success" do
      get :title
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #body:string" do
    it "returns http success" do
      get :body
      expect(response).to have_http_status(:success)
    end
  end

end
