json.person_id @current_user.id.to_s
json.me do
  json.person_id @current_user.id.to_s 
  json.extract! @current_user, :twitter, :facebook
end
