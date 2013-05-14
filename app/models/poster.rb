class Poster
  include Mongoid::Document
  field :description, type: String
  has_one :image
  belongs_to :event
  accepts_nested_attributes_for :image
end
