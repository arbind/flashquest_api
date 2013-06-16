# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
business = Business.create({
  name: 'Boba Bear',
  type: 'Cafe',
  url: 'http://www.bobabear.com'
})

branches = [
  {
    name: 'Boba Bear',
    address: '414 S Western Ave', 
    address2: 'Ste C', 
    city: 'Los Angeles', 
    state: 'CA', 
    zip: 90020, 
    neighborhood: 'Koreatown', 
    phone: '(213) 908-5595' 
  },
  {
    name: 'Boba Bear 2',
    address: '414 S Western Ave', 
    address2: 'Ste C', 
    city: 'Los Angeles', 
    state: 'CA', 
    zip: 90020, 
    neighborhood: 'Koreatown', 
    phone: '(213) 908-5595' 
  },
  {
    name: 'Boba Bear X',
    address: '414 S Western Ave', 
    address2: 'Ste C', 
    city: 'Los Angeles', 
    state: 'CA', 
    zip: 90020, 
    neighborhood: 'Koreatown', 
    phone: '(213) 908-5595' 
  }  

]
branches.each do | branch_info |
  branch = business.branches.create(branch_info)
  branch.quest_descriptions.create({
    active: true,
    type: :facebook_like,
    name: 'Like us on Facebook.',
    description: nil,
    points: 100,
    bonus_approval_points: 100,
    bonus_sharing_points: 50,
    approvals_required_for_points: 1,
    approvals_required_for_bonus: 5,
  })
  branch.quest_descriptions.create({
    active: true,
    type: :twitter_follow,
    name: 'Follow us on Twitter.',
    description: nil,
    points: 100,
    bonus_approval_points: 100,
    bonus_sharing_points: 50,
    approvals_required_for_points: 1,
    approvals_required_for_bonus: 5,
  })
  branch.quest_descriptions.create({
    active: true,
    type: :comment,
    name: 'Write up a review.',
    description: nil,
    points: 100,
    bonus_approval_points: 100,
    bonus_sharing_points: 50,
    approvals_required_for_points: 1,
    approvals_required_for_bonus: 5,
  })
  branch.quest_descriptions.create({
    active: true,
    type: :photo,
    name: 'Snap a picture of a menu item',
    description: nil,
    points: 100,
    bonus_approval_points: 100,
    bonus_sharing_points: 50,
    approvals_required_for_points: 1,
    approvals_required_for_bonus: 5,
  })
  branch.reward_descriptions.create({
    active: true,
    title: 'Free drink',
    description: '',
    points_required: 500
  })
  branch.reward_descriptions.create({
    active: true,
    title: '50% off',
    description: '',
    points_required: 1000
  })

  person = Person.create
  patron = branch.make_customer(person)
  patron.start_quest(branch.quest_descriptions.first)
  patron.redeem_reward(branch.reward_descriptions.first)

  person = Person.create
  patron = branch.make_customer(person)
  patron.start_quest(branch.quest_descriptions.second)
  patron.redeem_reward(branch.reward_descriptions.first)

  person = Person.create
  patron = branch.make_customer(person)
  patron.start_quest(branch.quest_descriptions.third)
  patron.redeem_reward(branch.reward_descriptions.last)

  person = Person.create
  patron = branch.make_customer(person)
  patron.start_quest(branch.quest_descriptions.last)
  patron.redeem_reward(branch.reward_descriptions.last)
end