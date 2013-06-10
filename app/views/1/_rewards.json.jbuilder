json.array! items do |reward|
  json.partial! '1/reward', reward: reward
end
