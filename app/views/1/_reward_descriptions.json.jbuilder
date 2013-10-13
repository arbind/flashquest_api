json.array! items do |reward_description|
  json.partial! '1/reward_description', reward_description: reward_description
end