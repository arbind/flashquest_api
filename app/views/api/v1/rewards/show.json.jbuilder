json.partial! '1/reward', reward: @reward

json.person do
  json.partial! '1/person', person: @reward.patron.person
 end

json.branch do
  json.partial! '1/branch', branch: @reward.patron.branch
end