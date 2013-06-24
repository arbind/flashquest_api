class Person
  include Mongoid::Document
  include Mongoid::Timestamps

  field :profiles, type: Hash
  has_many :devices

  has_many :patrons

  def quests
    Quest.in patron_id: patron_ids
  end

  def reviews
    Review.in patron_id: patron_ids
  end

  def rewards
    Reward.in patron_id: patron_ids
  end

  def branches
    Branch.in id: patrons.map(&:branch_id)
  end

  def businesses
    Business.in id: branches.map(&:business_id)
  end


  def patronize(branch)
    self.patrons.where(branch_id: branch.id).first_or_create!
  end

  def patron_ids() patrons.map(&:id) end
end