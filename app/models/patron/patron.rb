class Patron
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :person
  belongs_to :branch

  has_many :quests
  has_many :rewards
  has_many :activities

  def points_at_business
    person.points_at_business
  end

  def points #only at this branch (can be negative)
    quest_points - redeemed_points
  end

  def quest_points #only at this branch
    points = 0
    quests.each do |quest|
      points = points + quest.points
    end
    points
  end

  def redeemed_points #only at this branch
    points = 0
    rewards.each do |reward|
      points = points + reward.points
    end
    points
  end

  def start_quest(quest_description)
    self.quests.create({ quest_description_id: quest_description.id, type: quest_description.type})
  end

  def redeem_reward(reward_description)
    rewards.create({ reward_description_id: reward_description.id})
  end

end