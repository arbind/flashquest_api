require 'spec_helper'

describe "quest_definitions/show" do
  before(:each) do
    @quest_definition = assign(:quest_definition, stub_model(QuestDefinition,
      :type => "Type",
      :instructions => "Instructions",
      :acceptance_criteria => "Acceptance Criteria",
      :points => "",
      :points_for_sharing => "",
      :checkin_is_required => false,
      :must_do_at_location => false,
      :number_of_approvals_required => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type/)
    rendered.should match(/Instructions/)
    rendered.should match(/Acceptance Criteria/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(//)
  end
end
