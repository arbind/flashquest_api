class Business
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String

  embeds_many :business_quests
  embeds_many :business_rewards

  before_save :validate_quests
  has_many :patrons

  def quests()   Quest.where :patron_id.in => patron_ids end
  def reviews() Review.where :patron_id.in => patron_ids end
  def rewards() Reward.where :patron_id.in => patron_ids end

  private
    def patron_ids() self.patrons.map { |p| p.id } end  

    def validate_quests(*args)
      if business_quests.facebook_like.count > 1
        errors.add(:photo_quests,'Too many facebook like quests defined')
      end
      if business_quests.twitter_follow.count > 1
        errors.add(:photo_quests,'Too many twitter follow quests defined')
      end
      if business_quests.photo.count > 5
        errors.add(:photo_quests,'Too many photo quests defined')
      end
      if business_quests.review.count > 5
        errors.add(:review_quests,'Too many review quests defined')
      end
     errors.count.zero?
    end

end
