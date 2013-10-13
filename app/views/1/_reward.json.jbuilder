json.id reward.id.to_s

patron = reward.patron
json.patron_id    patron.id.to_s          if patron
json.person_id    patron.person.id.to_s   if patron.person
json.branch_id    patron.branch.id.to_s   if patron.branch
json.business_id  patron.branch.business.id.to_s if patron.branch and patron.branch.business

reward_description = patron.branch.reward_descriptions.find(reward.reward_description_id)

json.extract! reward_description, :active, :title, :description

json.points reward_description.points_required

json.extract! reward, :created_at, :updated_at