json.array!(@business.quests) do |quest|
  json.id quest.id.to_s
  json.person_id quest.patron.person.id.to_s
  json.patron_id quest.patron.id.to_s
  json.business_id @business.id.to_s
  json.extract! quest, :type, :status, :business_quest_id
end