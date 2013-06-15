class Patron
  include Mongoid::Document
  include Mongoid::Timestamps

  field :points, type: Integer
  field :level, type: Integer, default: 1

  belongs_to :person
  belongs_to :branch

  has_many :quests
  has_many :rewards

  def start_quest(quest_description)
    self.quests.create({ quest_description_id: quest_description.id, type: quest_description.type})
  end

  def redeem_reward(reward_description)
    rewards.create({ reward_description_id: reward_description.id})
  end

end