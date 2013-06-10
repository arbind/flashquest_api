json.array! items do |reward_description|
  json.id reward_description.id.to_s
  json.partial! '1/reward_description', reward_description: reward_description
end