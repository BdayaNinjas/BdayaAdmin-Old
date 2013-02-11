class Course
  include Mongoid::Document
  field :name, type: String
  field :semester, type: Integer
  field :major, type: String
  field :type

  has_and_belongs_to_many :members
  has_many :sessions

end
