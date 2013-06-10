class Reward
  include Mongoid::Document
  include Mongoid::Timestamps

  field :reward_description_id, type: Moped::BSON::ObjectId

  belongs_to :patron

end