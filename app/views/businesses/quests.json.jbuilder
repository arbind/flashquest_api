json.quests @business.quests do |quest|
  quest_description = quest.patron.branch.quest_descriptions.find(quest.quest_description_id)
  json.id quest.id.to_s
  json.business_id quest.patron.branch.business.id.to_s
  json.branch_id quest.patron.branch.id.to_s
  
  json.active quest_description.active
  json.type quest_description.type
  json.instructions quest_description.instructions
  json.acceptance_criteria quest_description.acceptance_criteria
  json.points quest_description.points
  json.points_for_sharing quest_description.points_for_sharing
  json.checkin_is_required quest_description.checkin_is_required
  json.must_do_at_location quest_description.must_do_at_location
  json.number_of_approvals_required quest_description.number_of_approvals_required
end

