class Booth
  include Mongoid::Document
  field :description, type: String
  has_many :images
  belongs_to :event
  accepts_nested_attributes_for :images
end
