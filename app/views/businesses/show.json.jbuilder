json.id @business.id.to_s
json.name 'Boba Bear'
json.type 'Cafe'
json.address '3500 Figuero St, Los Angeles, CA'
json.rewards [{id: 1, reward: '10% off'},{id: 2, reward: '10% off'}]
json.business_quests [
  {
    id:3, 
    active: true,
    type: :photo,
    instructions: 'take a picture of a friend',
    acceptance_criteria: 'they must be eating something',
    points: 10,
    points_for_sharing: 8,
    checkin_is_required: false,
    must_do_at_location: false
  },
  {
    id:3, 
    active: true,
    type: :review,
    instructions: 'write a review',
    acceptance_criteria: 'you should write something good',
    points: 12,
    points_for_sharing: 5,
    checkin_is_required: false,
    must_do_at_location: false
  }
]

json.extract! @business, :name, :created_at, :updated_at
