json.business_path api_v1_business_path business
json.extract! business, :name, :type, :url
json.branches business.branches.count

json.extract! business, :created_at, :updated_at