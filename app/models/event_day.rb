class EventDay
  include Mongoid::Document
  field :date, type: DateTime
  has_many :images
  belongs_to :event
end
