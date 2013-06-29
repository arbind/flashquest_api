class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  before_save :log_activity

  field :rating, type: Integer
  field :headline, type: String
  field :text, type: String
  field :photo_url, type: String
  field :status, type: Symbol, default: :pending_approval

  has_one     :activity, as: :source

  belongs_to  :quest
  belongs_to  :person

private
  def log_activity
    return true if self.activity
    self.activity = Activity.create person: self.person, source: self
  end
end