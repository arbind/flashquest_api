class Quest
  include Mongoid::Document
  include Mongoid::Timestamps

  field :type, type: Symbol, default: :quest
  field :quest_description_id, type: Moped::BSON::ObjectId
  field :status, type: Symbol, default: :pending_approval
  field :was_shared_on_twitter, type: String
  field :was_shared_on_facebook, type: String

  belongs_to :patron
  has_one :review

  embeds_many :comments
  embeds_many :approvals
end