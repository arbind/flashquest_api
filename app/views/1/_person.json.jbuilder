json.person_path person_path person
json.extract! person.profiles

json.patrons do
  json.array! person.patrons do |patron|
    json.partial! '1/patron', patron: patron
  end
end