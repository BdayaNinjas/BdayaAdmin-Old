class Session
  include Mongoid::Document
  field :timing, type: Time
  field :notes, type: String

  belongs_to :member
  belongs_to :course
  has_one :request
end
