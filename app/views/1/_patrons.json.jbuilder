json.array! items do |patron|
  json.partial! '1/patron', patron: patron
end