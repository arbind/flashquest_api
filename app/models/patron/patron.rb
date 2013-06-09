class Patron
  include Mongoid::Document
  include Mongoid::Timestamps

  field :points, type: Integer
  field :level, type: Integer, default: 1

  belongs_to :person
  belongs_to :business

  has_many :quests
  has_many :reviews
  has_many :rewards
end