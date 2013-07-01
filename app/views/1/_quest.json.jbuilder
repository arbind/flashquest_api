json.quest_path api_v1_quest_path quest
json.partial! '1/patron_ids', patron: quest.patron

json.status quest.status
json.num_approvals quest.approvals.count
json.num_comments quest.comments.count

branch = quest.patron.branch
quest_description = branch.quest_descriptions.find(quest.quest_description_id)

json.partial! '1/quest_description', quest_description: quest_description

if quest.review.present?
  json.review do
    json.extract! quest.review, :rating, :headline, :text, :photo_url
  end
end

json.comments  { json.partial! '1/comments', items: quest.comments }

json.approvals { json.array! quest.approvals }

json.extract! quest, :created_at, :updated_at