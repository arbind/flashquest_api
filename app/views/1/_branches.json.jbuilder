json.array! items do |branch|
  json.partial! '1/branch', branch: branch
end
