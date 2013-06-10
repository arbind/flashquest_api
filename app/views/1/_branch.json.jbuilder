json.branch_path branch_path branch

json.name branch.name || branch.business.name
json.type branch.type || branch.business.type
json.url branch.url   || branch.business.url
json.url branch.phone || branch.business.phone

json.extract! branch, :address, :address2, :city, :state, :zip, :neighborhood, :created_at, :updated_at

json.quest_descriptions do
  json.partial! '1/quest_descriptions', items: branch.quest_descriptions
end

json.reward_descriptions do
  json.partial! '1/reward_descriptions', items: branch.reward_descriptions
end