require 'rails_helper'

RSpec.describe "Api::Characters", :type => :request do
  describe "GET /api_characters" do
    it "works! (now write some real specs)" do
      get api_characters_path
      expect(response).to have_http_status(200)
    end
  end
end
