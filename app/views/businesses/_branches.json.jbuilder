json.array! @business.branches do |branch|
  json.id branch.id.to_s

  json.name branch.name || @business.name
  json.type branch.type || @business.type
  json.url branch.url || @business.url
  json.url branch.phone || @business.phone

  json.extract! branch, :address, :address2, :city, :state, :zip, :neighborhood, :created_at, :updated_at

  json.rewards branch.reward_descriptions do |reward|
    json.id reward.id.to_s
    json.extract! reward, :active, :title, :description, :points_required
  end

  json.business_quests branch.quest_descriptions do |quest|
    json.id quest.id.to_s
    json.extract! quest, :active, :type, :instructions, :acceptance_criteria, :points, :points_for_sharing, :checkin_is_required, :must_do_at_location, :number_of_approvals_required
  end

end
