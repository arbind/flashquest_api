class Business
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :type, type: String
  field :url, type: String
  field :phone, type: String

  has_many :branches

  def quests
    Quest.in patron_id: patron_ids
  end

  def rewards
    Reward.in patron_id: patron_ids
  end

  def patrons() collect_from_branch(:patrons) end
  def patron_ids() collect_from_branch(:patron_ids) end

private
  def collect_from_branch(method)
    a = []
    branches.each { |branch| a += branch.send(method) }
    a
  end

end
