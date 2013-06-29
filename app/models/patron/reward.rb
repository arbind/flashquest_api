class Reward
  include Mongoid::Document
  include Mongoid::Timestamps
  before_save :log_activity

  field :reward_description_id, type: Moped::BSON::ObjectId

  has_one     :activity, as: :source

  belongs_to  :patron

private
  def log_activity
    return true if self.activity
    self.activity = Activity.create person: self.patron.person, patron: self.patron, source: self
  end
end