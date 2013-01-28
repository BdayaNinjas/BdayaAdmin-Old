class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description, type:String
  field :status, type: Integer
  field :deadline, type: Date

  embeds_one :created_by, class_name: "Member", inverse_of: :creates
  embedded_in :assigned_to, class_name: "Member", inverse_of: :has
end
