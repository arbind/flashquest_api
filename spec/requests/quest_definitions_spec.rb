require 'spec_helper'

describe "QuestDefinitions" do
  describe "GET /quest_definitions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get quest_definitions_path
      response.status.should be(200)
    end
  end
end
