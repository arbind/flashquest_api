json.quest_path quest_path quest
json.partial! '1/patron_ids', patron: quest.patron

json.status quest.status
json.approvals_count = -1

branch = quest.patron.branch
quest_description = branch.quest_descriptions.find(quest.quest_description_id)

json.partial! '1/quest_description', quest_description: quest_description

if quest.review.present?
  json.review do
    json.partial! '1/review', review: quest.review
  end
end

json.extract! quest, :created_at, :updated_at