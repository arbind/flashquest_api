json.id business.id.to_s
json.extract! business, :name, :type, :url
json.branches business.branches.count