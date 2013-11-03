class Business
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :type, type: String
  field :url, type: String
  field :phone, type: String

  field :twitter_url, type: String
  field :facebook_url, type: String

  field :hidden, type: Boolean, default: false

  has_many :branches

  default_scope excludes(hidden: true) # skip hidden branches
  scope :private, where(hidden: true)
  scope :public, excludes(hidden: true)

  def quests
    Quest.in patron_id: patron_ids
  end

  def rewards
    Reward.in patron_id: patron_ids
  end

  def people
    Person.in id: people_ids
  end

  def activities
    Activity.in person_id: people_ids
  end

  def patrons() collect_from_branch(:patrons) end
  def patron_ids() collect_from_branch(:patron_ids) end
  def people_ids() patrons.map(&:person_id) end

private
  def collect_from_branch(method)
    a = []
    branches.each { |branch| a += branch.send(method) }
    a
  end

end
