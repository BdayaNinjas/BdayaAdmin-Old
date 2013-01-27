class Task
  include Mongoid::Document
  field :creator, type: String
  field :assigned, type: String
  field :status, type: Integer
  field :deadline, type: Date
end
