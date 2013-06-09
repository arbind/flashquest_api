class BusinessQuest
  include Mongoid::Document
  include Mongoid::Timestamps

  field :active, type: Boolean
  field :type, type: Symbol, default: :quest
  field :instructions, type: String
  field :acceptance_criteria, type: String
  field :points, type: Integer, default: 1
  field :points_for_sharing, type: Integer, default: 1
  field :checkin_is_required, type: Boolean, default: true
  field :must_do_at_location, type: Boolean, default: false
  field :number_of_approvals_required, type: Integer, default: 1

  embedded_in :business

  scope :photo, where(type: :photo)
  scope :review, where(type: :review)
  scope :facebook_like, where(type: :facebook_like)
  scope :twitter_follow, where(type: :twitter_follow)
end
