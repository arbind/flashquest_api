class Activity
  include Mongoid::Document
  include Mongoid::Timestamps
  before_save :define_type

  field :type, type: Symbol

  belongs_to :person
  belongs_to :patron
  belongs_to :source, polymorphic: true

private
  def define_type
    return true if self.type
    self.type = source.class.name.downcase.to_sym
  end
end