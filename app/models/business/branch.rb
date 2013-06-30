class Branch
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :type, type: String
  field :url, type: String
  field :phone, type: String

  field :address, type: String
  field :address2, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: Integer
  field :neighborhood, type: String

  embeds_many :quest_descriptions
  embeds_many :reward_descriptions

  has_many :patrons

  belongs_to :business

  before_save :validate_quests

  def make_customer(person) person.patronize(self) end

  def quests
    Quest.in patron_id: patron_ids
  end

  def reviews
    Review.in patron_id: patron_ids
  end

  def rewards
    Reward.in patron_id: patron_ids
  end

  def people
    Person.in id: people_ids
  end

  def patron_ids() patrons.map(&:id) end
  def people_ids() patrons.map(&:person_id) end

private

  def validate_quests(*args)
    if quest_descriptions.facebook_like.count > 1
      errors.add(:photo_quests,'Too many facebook like quests defined')
    end
    if quest_descriptions.twitter_follow.count > 1
      errors.add(:photo_quests,'Too many twitter follow quests defined')
    end
    if quest_descriptions.photo.count > 5
      errors.add(:photo_quests,'Too many photo quests defined')
    end
    if quest_descriptions.review.count > 5
      errors.add(:review_quests,'Too many review quests defined')
    end
   errors.count.zero?
  end

end