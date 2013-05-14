class Logo
  include Mongoid::Document
  field :description, type: String
  has_one :image
  attr_accessible :image
  belongs_to :event
  accepts_nested_attributes_for :image
end
