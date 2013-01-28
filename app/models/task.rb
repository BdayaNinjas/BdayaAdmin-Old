class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description, type:String
  field :status, type: Integer
  field :deadline, type: Date

  belongs_to :creator
  belongs_to :member
end
