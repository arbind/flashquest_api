json.partial! '1/patron_ids', patron: patron

json.extract! patron, :points, :level
