class Course
  include Mongoid::Document
  field :name, type: String
  field :semester, type: Integer
  field :faculty, type: String

  #:has_many members

end
