json.partial! '1/quest', quest: @quest

json.partial! '1/person', person: @quest.patron.person
json.partial! '1/branch', branch: @quest.patron.branch
