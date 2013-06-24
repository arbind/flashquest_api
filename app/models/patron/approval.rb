class Approval
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :quest
  belongs_to :person
end