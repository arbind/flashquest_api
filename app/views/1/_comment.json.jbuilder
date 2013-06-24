json.id comment.id

json.extract! comment, :rating, :headline, :text, :photo_url, :status

json.person do
  json.id comment.person.id.to_s
  json.display_name comment.person.display_name
end
