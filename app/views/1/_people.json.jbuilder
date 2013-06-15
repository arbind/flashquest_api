json.array! items do |person|
  json.partial! '1/person', person: person
end