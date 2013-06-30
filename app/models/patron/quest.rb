class Quest
  include Mongoid::Document
  include Mongoid::Timestamps
  before_save :log_activity

  field :type, type: Symbol, default: :quest
  field :quest_description_id, type: Moped::BSON::ObjectId
  field :status, type: Symbol, default: :pending_approval
  field :was_shared_on_twitter, type: String
  field :was_shared_on_facebook, type: String

  embeds_one  :review
  has_many    :comments
  has_many    :approvals
  has_one     :activity, as: :source

  belongs_to  :patron

  def points
    quest =
    description = patron.branch.quest_descriptions.find(quest_description_id)
    if description.approvals_required_for_points <= approvals.count
      description.points
    else
      0
    end
  end

private
  def log_activity
    return true if self.activity
    self.activity = Activity.create person: self.patron.person, patron: self.patron, source: self
  end
end