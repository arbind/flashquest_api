json.id quest_description.id.to_s

json.extract! quest_description, :active, :type, :name, :description, :points, :bonus_approval_points, :bonus_sharing_points, :approvals_required_for_points, :approvals_required_for_bonus

json.extract! quest_description, :created_at, :updated_at