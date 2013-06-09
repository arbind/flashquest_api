require "spec_helper"

describe QuestDefinitionsController do
  describe "routing" do

    it "routes to #index" do
      get("/quest_definitions").should route_to("quest_definitions#index")
    end

    it "routes to #new" do
      get("/quest_definitions/new").should route_to("quest_definitions#new")
    end

    it "routes to #show" do
      get("/quest_definitions/1").should route_to("quest_definitions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/quest_definitions/1/edit").should route_to("quest_definitions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/quest_definitions").should route_to("quest_definitions#create")
    end

    it "routes to #update" do
      put("/quest_definitions/1").should route_to("quest_definitions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/quest_definitions/1").should route_to("quest_definitions#destroy", :id => "1")
    end

  end
end
