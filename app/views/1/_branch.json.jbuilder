json.id branch.id.to_s

json.business_id branch.business.id.to_s

json.name branch.name   || branch.business.name
json.type branch.type   || branch.business.type
json.phone branch.phone || branch.business.phone
json.url branch.url     || branch.business.url
json.facebook_url branch.facebook_url   || branch.business.facebook_url
json.twitter_url branch.twitter_url     || branch.business.twitter_url

@person = @patron.person if @patron and @person.nil?
@patron = branch.patrons.where(person_id: @person.id).first if @person and @patron.nil?

json.points @person.points_at_business(branch.business) if @person

json.points_at_branch @person.points_at_business(branch.business) if @person
json.points_at_branch @patron.person.points_at_business(branch.business) if @patron

json.extract! branch, :address, :address2, :city, :state, :zip, :neighborhood

json.quest_descriptions do
  json.partial! '1/quest_descriptions', items: branch.quest_descriptions
end

json.reward_descriptions do
  json.partial! '1/reward_descriptions', items: branch.reward_descriptions
end

json.extract! branch, :created_at, :updated_at