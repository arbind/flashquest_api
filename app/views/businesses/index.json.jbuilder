json.array! @businesses do |business|
  json.id business.id.to_s
  json.extract! business, :name, :type, :url
end