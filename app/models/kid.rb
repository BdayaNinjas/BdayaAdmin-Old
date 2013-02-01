class Kid
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  validates_presence_of :name, :message => "Name must be provided."
  field :age, type: Integer
  validates :age, :presence => true
  validates_numericality_of :age, :greater_than => 0, :less_than => 19, :message => "Age has to be a number between 1 and 18."
  field :address, type: String
  field :strengths, type: String
  field :weaknesses, type: String
  field :notes, type: String

end
