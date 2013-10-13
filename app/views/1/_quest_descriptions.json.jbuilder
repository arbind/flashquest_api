json.array! items do |quest_description|
  json.partial! '1/quest_description', quest_description: quest_description
end