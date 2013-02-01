class Notification
  include Mongoid::Document
  include Mongoid::Timestamps

  field :member1, type: Integer
  field :member2, type: Integer
  field :number, type: Integer
  field :type, type: Integer
  field :seen, type: Boolean
  field :desc, type: String

end
