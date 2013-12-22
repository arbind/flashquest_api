class Person
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  field :twitter,  type: Hash
  field :facebook, type: Hash

  has_many :devices

  has_many :patrons
  has_many :comments
  has_many :approvals
  has_many :activities

  def nickname
    @nickname ||= name
    @nickname ||= facebook['name'] if facebook
    @nickname ||= twitter['name'] if twitter
    @nickname ||= "@#{twitter['screen_name']}" if twitter
    @nickname ||= facebook['username'] if facebook
    @nickname
  end

  def avatar
    @avatar ||= facebook['avatar'] if facebook
    @avatar ||= twitter['avatar'] if twitter
    @avatar
  end

  def points_at_business(business)
    points = 0
    business.branches.each do |branch|
      patron = branch.patrons.where(person_id: self.id).first
      points = points + patron.points if patron
    end
    points
  end

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