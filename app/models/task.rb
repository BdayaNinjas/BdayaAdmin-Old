class Task
  include Mongoid::Document
  field :creator, type: String
  field :assigned, type: String
  field :status, type: Int
  field :deadline, type: Date
end
