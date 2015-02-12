require "rails_helper"

RSpec.describe Api::CharactersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/characters").to route_to("api/characters#index")
    end

    it "routes to #new" do
      expect(:get => "/api/characters/new").to route_to("api/characters#new")
    end

    it "routes to #show" do
      expect(:get => "/api/characters/1").to route_to("api/characters#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/api/characters/1/edit").to route_to("api/characters#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/api/characters").to route_to("api/characters#create")
    end

    it "routes to #update" do
      expect(:put => "/api/characters/1").to route_to("api/characters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/characters/1").to route_to("api/characters#destroy", :id => "1")
    end

  end
end
