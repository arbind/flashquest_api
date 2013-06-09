json.array!(@businesses) do |business|
  json.id business.id.to_s
  json.extract! business, :name
  json.url business_url(business, format: :json)
end