class Session
  include Mongoid::Document
  field :room, type: String
  field :timing, type: Time

  #has_one member
  #has_one course
end
