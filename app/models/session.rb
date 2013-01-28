class Session
  include Mongoid::Document
  field :timing, type: Time

  belongs_to :member
  belongs_to :course
  has_one :request
end
