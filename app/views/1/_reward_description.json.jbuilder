json.id reward_description.id.to_s

json.extract! reward_description, :active, :title, :description, :points_required

json.extract! reward_description, :created_at, :updated_at