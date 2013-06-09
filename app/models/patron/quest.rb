class Quest
  include Mongoid::Document
  include Mongoid::Timestamps

  field :type, type: Symbol
  field :status, type: Symbol, default: :pending_approval
  field :business_quest_id, type: String
  field :was_shared_on_twitter, type: String
  field :was_shared_on_facebook, type: String

  belongs_to :patron
  has_one :review

end