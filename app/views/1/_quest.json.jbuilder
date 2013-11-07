json.id  quest.id.to_s

patron = quest.patron
json.patron_id  patron.id.to_s
json.business_id  patron.branch.business.id.to_s if patron.branch and patron.branch.business

json.status quest.status
json.num_approvals quest.approvals.count
json.num_comments quest.comments.count

if patron and patron.branch
  branch = patron.branch
  json.branch do
    json.id branch.id.to_s
    json.extract! branch, :name, :phone, :address, :address2, :city, :state, :zip
  end

  quest_description = branch.quest_descriptions.find(quest.quest_description_id)

  json.extract! quest_description, :active, :type, :name, :description, :points, :bonus_approval_points, :bonus_sharing_points, :approvals_required_for_points, :approvals_required_for_bonus
end

person = patron.person if patron
json.person do
  json.id person.id.to_s
  json.extract! person, :nickname, :avatar
end if person

json.review do
  json.extract! quest.review, :rating, :headline, :text, :photo_url
end if quest.review

json.comments  { json.partial! '1/comments', items: quest.comments }

json.approvals { json.array! quest.approvals }

json.extract! quest, :created_at, :updated_at