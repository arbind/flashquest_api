class Business
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :type, type: String
  field :url, type: String

  has_many :branches

  def quests()   Quest.where :patron_id.in => patron_ids end
  def reviews() Review.where :patron_id.in => patron_ids end
  def rewards() Reward.where :patron_id.in => patron_ids end

  def patrons() collect_from_branch(:patrons) end
  def patron_ids() collect_from_branch(:patron_ids) end

  private
  def collect_from_branch(method)
    a = []
    branches.each { |branch| a += branch.send(method) }
    a    
  end

end
