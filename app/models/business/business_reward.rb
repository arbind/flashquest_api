class BusinessReward
  include Mongoid::Document
  include Mongoid::Timestamps

  field :active, type: Boolean
  field :title, type: String
  field :description, type: String
  field :points_required, type: Integer, default: 88888888
  
  embedded_in :business
end