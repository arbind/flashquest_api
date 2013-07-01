json.partial! '1/quest', quest: @quest

json.person do
  json.partial! '1/person', person: @quest.patron.person
end

json.branch do
  json.partial! '1/branch', branch: @quest.patron.branch
end