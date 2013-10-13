json.id comment.id.to_s

json.extract! comment, :rating, :headline, :text, :photo_url, :status

json.person do
  json.extract! comment.person, :id, :name
end
