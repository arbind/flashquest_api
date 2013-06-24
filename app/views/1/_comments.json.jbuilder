json.array! items do |comment|
  json.partial! '1/comment', comment: comment
end