class Device
  include Mongoid::Document
  include Mongoid::Timestamps

  field :identifier, type: String
  
  embedded_in :user
end