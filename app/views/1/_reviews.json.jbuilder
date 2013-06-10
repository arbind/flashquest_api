json.array! items do |review|
  json.partial! '1/review', review: review
end