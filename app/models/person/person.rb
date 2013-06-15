class Person
  include Mongoid::Document
  include Mongoid::Timestamps

  field :profiles, type: Hash

  embeds_many :devices

  has_many :patrons

  def quests()   Quest.where :patron_id.in => patron_ids end
  def reviews() Review.where :patron_id.in => patron_ids end
  def rewards() Reward.where :patron_id.in => patron_ids end

  def patronize(branch)
    self.patrons.where(branch_id: branch.id).first_or_create!
  end
  
  private
    def patron_ids() self.patrons.map { |p| p.id } end
end