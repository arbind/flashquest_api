json.review_path review_path review
json.partial! '1/patron_ids', patron: review.patron

json.extract! review, :rating, :headline, :comment, :photo_url, :status

json.extract! review, :created_at, :updated_at