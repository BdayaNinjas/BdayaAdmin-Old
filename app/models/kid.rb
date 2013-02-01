class Kid
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  validates :name, :presence => true
  field :age, type: Integer
  validates :age, :presence => true, :numericality => {:greater_than => 0, :less_than => 19}
  field :address, type: String
  field :strengths, type: String
  field :weaknesses, type: String
  field :notes, type: String

end
