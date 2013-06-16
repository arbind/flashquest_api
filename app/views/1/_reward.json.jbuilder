json.reward_path reward_path reward
json.partial! '1/patron_ids', patron: reward.patron

branch = reward.patron.branch
reward_description = branch.reward_descriptions.find(reward.reward_description_id)

json.extract! reward_description, :title, :description

json.points reward_description.points_required

json.extract! reward, :created_at, :updated_at