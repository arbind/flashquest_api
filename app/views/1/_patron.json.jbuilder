json.id  patron.id.to_s if patron

json.person_id    patron.person.id.to_s   if patron.person
json.branch_id    patron.branch.id.to_s   if patron.branch
json.business_id  patron.branch.business.id.to_s if patron.branch and patron.branch.business

json.extract! patron, :created_at, :updated_at

json.points  -1