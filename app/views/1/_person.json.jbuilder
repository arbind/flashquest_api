json.id person.id.to_s

json.extract! person, :twitter, :facebook

json.patrons do
  json.array! person.patrons do |patron|
    json.partial! '1/patron', patron: patron
  end
end

json.extract! person, :created_at, :updated_at