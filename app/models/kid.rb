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

  # performance hash , indexed as follows: perf  = {"friday" => {"session1" => "" , "session2" => "" , "session3" => ""}}
  field :performance, type: Hash , default: {}
  has_and_belongs_to_many :fridays, class_name: "CareFriday" , inverse_of: :kids


end
