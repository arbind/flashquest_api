require 'spec_helper'

describe "quest_definitions/index" do
  before(:each) do
    assign(:quest_definitions, [
      stub_model(QuestDefinition,
        :type => "Type",
        :instructions => "Instructions",
        :acceptance_criteria => "Acceptance Criteria",
        :points => "",
        :points_for_sharing => "",
        :checkin_is_required => false,
        :must_do_at_location => false,
        :number_of_approvals_required => ""
      ),
      stub_model(QuestDefinition,
        :type => "Type",
        :instructions => "Instructions",
        :acceptance_criteria => "Acceptance Criteria",
        :points => "",
        :points_for_sharing => "",
        :checkin_is_required => false,
        :must_do_at_location => false,
        :number_of_approvals_required => ""
      )
    ])
  end

  it "renders a list of quest_definitions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Instructions".to_s, :count => 2
    assert_select "tr>td", :text => "Acceptance Criteria".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
