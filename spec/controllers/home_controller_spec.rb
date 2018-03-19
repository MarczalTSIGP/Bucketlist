require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  
  describe "GET #index" do
    it "responds successfully with HTTP 200 status code" do
      get :index
      expect(response).to be_success # The be_success checks that the HTTP status is between 200 and 299
      expect(response).to have_http_status(200)
    end
  end

end
