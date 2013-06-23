skip ||= {}
person = patron.person
branch = patron.branch
business = branch.business

json.person_path api_v1_person_path person unless skip[:person].present?
json.patron_path api_v1_patron_path patron unless skip[:patron].present?
json.business_path api_v1_business_path business unless skip[:business].present?
json.branch_path api_v1_branch_path branch unless skip[:branch].present?

json.extract! patron, :created_at, :updated_at