class QuestDescription
  include Mongoid::Document
  include Mongoid::Timestamps

  field :active, type: Boolean
  field :type, type: Symbol, default: :quest
  field :name, type: String
  field :description, type: String
  field :points, type: Integer, default: 1
  field :bonus_approval_points, type: Integer, default: 1
  field :bonus_sharing_points, type: Integer, default: 1
  field :approvals_required_for_points, type: Integer, default: 1
  field :approvals_required_for_bonus, type: Integer, default: 1

  embedded_in :branch

  scope :photo, where(type: :photo)
  scope :review, where(type: :review)
  scope :facebook_like, where(type: :facebook_like)
  scope :twitter_follow, where(type: :twitter_follow)


  def start(person)
    patron = person.patrons.where(branch_id: self.branch.id)
    puts patron
  end
end
