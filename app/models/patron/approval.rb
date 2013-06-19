class Approval
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :quest
  belongs_to :person
end