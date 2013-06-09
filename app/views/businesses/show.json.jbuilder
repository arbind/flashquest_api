json.id @business.id.to_s
json.extract! @business, :name, :type, :address, :address2, :city, :state, :zip, :created_at, :updated_at
json.rewards @business.business_rewards do |reward|
  json.id reward.id.to_s
  json.extract! reward, :active, :title, :description, :points_required
end

json.business_quests @business.business_quests do |quest|
  json.id quest.id.to_s
  json.extract! quest, :active, :type, :instructions, :acceptance_criteria, :points, :points_for_sharing, :checkin_is_required, :must_do_at_location, :number_of_approvals_required
end