json.array! items do |activity|
  json.partial! '1/activity', activity: activity
end
