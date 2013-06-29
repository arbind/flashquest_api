json.activity_path api_v1_activity_path activity
json.person_path api_v1_person_path activity.person if activity.person
json.patron_path api_v1_person_path activity.person if activity.patron

json.type activity.type

if activity.source.kind_of? Quest
  json.quest do
    json.partial! '1/quest', quest: activity.source
  end
end

if activity.source.kind_of? Reward
  json.reward do
    json.partial! '1/reward', reward: activity.source
  end
end

if activity.source.kind_of? Approval
  json.approval do
    json.partial! '1/approval', approval: activity.source
  end
end

if activity.source.kind_of? Comment
  json.comment do
    json.partial! '1/comment', comment: activity.source
  end
end