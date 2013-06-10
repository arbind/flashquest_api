json.array! items do |quest_description|
  json.id quest_description.id.to_s
  json.partial! '1/quest_description', quest_description: quest_description
end