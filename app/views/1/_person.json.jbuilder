json.person_path api_v1_person_path person
json.extract! person, :display_name, :twitter_profile, :facebook_profile

json.patrons do
  json.array! person.patrons do |patron|
    json.partial! '1/patron', patron: patron
  end
end

json.extract! person, :created_at, :updated_at