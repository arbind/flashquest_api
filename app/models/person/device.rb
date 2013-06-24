class Device
  include Mongoid::Document
  include Mongoid::Timestamps

  field :identifier, type: String
  field :access_token, type: String

  belongs_to :person

  before_create :generate_access_token


private
  def generate_access_token
    self.access_token = "#{identifier}.#{SecureRandom.hex}"
  end

end