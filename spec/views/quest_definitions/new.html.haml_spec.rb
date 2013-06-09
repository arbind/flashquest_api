require 'spec_helper'

describe "quest_definitions/new" do
  before(:each) do
    assign(:quest_definition, stub_model(QuestDefinition,
      :type => "",
      :instructions => "MyString",
      :acceptance_criteria => "MyString",
      :points => "",
      :points_for_sharing => "",
      :checkin_is_required => false,
      :must_do_at_location => false,
      :number_of_approvals_required => ""
    ).as_new_record)
  end

  it "renders new quest_definition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", quest_definitions_path, "post" do
      assert_select "input#quest_definition_type[name=?]", "quest_definition[type]"
      assert_select "input#quest_definition_instructions[name=?]", "quest_definition[instructions]"
      assert_select "input#quest_definition_acceptance_criteria[name=?]", "quest_definition[acceptance_criteria]"
      assert_select "input#quest_definition_points[name=?]", "quest_definition[points]"
      assert_select "input#quest_definition_points_for_sharing[name=?]", "quest_definition[points_for_sharing]"
      assert_select "input#quest_definition_checkin_is_required[name=?]", "quest_definition[checkin_is_required]"
      assert_select "input#quest_definition_must_do_at_location[name=?]", "quest_definition[must_do_at_location]"
      assert_select "input#quest_definition_number_of_approvals_required[name=?]", "quest_definition[number_of_approvals_required]"
    end
  end
end
