json.array!(@business.reviews) do |review|
  json.id review.id.to_s
  json.person_id review.patron.person.id.to_s
  json.patron_id review.patron.id.to_s
  json.business_id @business.id.to_s
  json.extract! review, :rating, :headline, :comment, :photo_url, :status
end