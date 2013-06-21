class EventItem
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :description

  has_one :image
  has_many :ratings
  belongs_to :event
end
