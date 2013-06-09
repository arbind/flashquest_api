class Reward
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :points, type: Integer, default: 0
  field :business_reward_id, type: String

  belongs_to :patron

end