json.array! @patrons do |patron|
  json.partial! '1/person', person: patron.person
end
