json.branch_path branch_path branch
json.business_path business_path branch.business

json.name branch.name || branch.business.name
json.type branch.type || branch.business.type
json.url branch.url   || branch.business.url
json.url branch.phone || branch.business.phone

json.extract! branch, :address, :address2, :city, :state, :zip, :neighborhood

json.quest_descriptions do
  json.partial! '1/quest_descriptions', items: branch.quest_descriptions
end

json.reward_descriptions do
  json.partial! '1/reward_descriptions', items: branch.reward_descriptions
end

json.extract! branch, :created_at, :updated_at