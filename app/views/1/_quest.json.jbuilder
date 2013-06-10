json.quest_path quest_path quest
json.partial! '1/patron_ids', patron: quest.patron

branch = quest.patron.branch
quest_description = branch.quest_descriptions.find(quest.quest_description_id)

json.extract! quest_description, :active, :type, :instructions, :acceptance_criteria, :points, :points_for_sharing, :checkin_is_required, :must_do_at_location, :number_of_approvals_required

if quest.review.present?
  json.review do
    json.partial! '1/review', review: quest.review
  end
end