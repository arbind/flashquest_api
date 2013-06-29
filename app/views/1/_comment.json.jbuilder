json.id comment.id

json.extract! comment, :rating, :headline, :text, :photo_url, :status

json.person do
  json.extract! comment.person, :id, :name
end
