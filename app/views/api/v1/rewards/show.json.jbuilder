json.partial! '1/reward', reward: @reward

json.partial! '1/person', person: @reward.patron.person
json.partial! '1/branch', branch: @reward.patron.branch