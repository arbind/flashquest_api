class Patron
  include Mongoid::Document
  include Mongoid::Timestamps

  field :points, type: Integer
  field :level, type: Integer, default: 1

  belongs_to :person
  belongs_to :branch

  has_many :quests
  has_many :reviews
  has_many :rewards

  def start_quest(quest_description)
    quests.create({ quest_description_id: quest_description.id})
  end

end