skip ||= {}
person = patron.person
branch = patron.branch
business = branch.business

json.person_path person_path person unless skip[:person].present?
json.patron_path patron_path patron unless skip[:patron].present?
json.business_path business_path business unless skip[:business].present?
json.branch_path branch_path branch unless skip[:branch].present?