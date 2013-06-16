json.business_path business_path business
json.extract! business, :name, :type, :url
json.branches business.branches.count

json.extract! business, :created_at, :updated_at