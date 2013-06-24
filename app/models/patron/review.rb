class Review
  include Mongoid::Document
  include Mongoid::Timestamps

  field :rating, type: Integer
  field :headline, type: String
  field :text, type: String
  field :photo_url, type: String
  field :status, type: Symbol, default: :pending_approval

  embedded_in :quest
end