json.id business.id.to_s

json.extract! business, :name, :type, :url
json.branches business.branches.count

@person = @patron.person if @patron and @person.nil?

json.points @person.points_at_business(business) if @person

json.extract! business, :created_at, :updated_at