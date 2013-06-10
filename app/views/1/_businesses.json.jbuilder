json.array! items do |business|
  json.partial! '1/business', business: business
end