json.array!(@business.rewards) do |reward|
  json.id reward.id.to_s
  json.person_id reward.patron.person.id.to_s
  json.patron_id reward.patron.id.to_s
  json.business_id @business.id.to_s
  json.extract! reward, :title, :description, :points, :business_reward_id
end