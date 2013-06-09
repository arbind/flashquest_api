# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
  business = Business.create({
    name: 'Boba Bear',
    type: 'Cafe',
    address: '414 S Western Ave',
    address2: 'Ste C',
    city: 'Los Angeles',
    state: 'CA',
    zip: 90020,
    neighborhood: 'Koreatown',
    phone: '(213) 908-5595',
    url: 'http://www.bobabear.com'
  })
  business.business_quests.create({
    active: true,
    type: :facebook_like,
    instructions: '',
    acceptance_criteria: '',
    points: 100,
    points_for_sharing: 0,
    checkin_is_required: false,
    must_do_at_location: false,
    number_of_approvals_required: 0,
  })
  business.business_quests.create({
    active: true,
    type: :twitter_follow,
    instructions: '',
    acceptance_criteria: '',
    points: 100,
    points_for_sharing: 0,
    checkin_is_required: false,
    must_do_at_location: false,
    number_of_approvals_required: 0,
  })
  business.business_quests.create({
    active: true,
    type: :review,
    instructions: '',
    acceptance_criteria: '',
    points: 200,
    points_for_sharing: 100,
    checkin_is_required: false,
    must_do_at_location: false,
    number_of_approvals_required: 1,
  })
  business.business_quests.create({
    active: true,
    type: :photo,
    instructions: '',
    acceptance_criteria: '',
    points: 200,
    points_for_sharing: 100,
    checkin_is_required: false,
    must_do_at_location: false,
    number_of_approvals_required: 1,
  })
  business.business_rewards.create({
    active: true,
    title: 'Free drink',
    description: '',
    points_required: 500
  })
  business.business_rewards.create({
    active: true,
    title: '50% off',
    description: '',
    points_required: 1000
  })