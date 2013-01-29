class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description, type:String
  field :status, type: Integer
  field :deadline, type: Date

  belongs_to :created_by, class_name: "Member", inverse_of: :created_tasks
  belongs_to :assigned_to, class_name: "Member", inverse_of: :assigned_tasks

  def self.get_tasks (member)
  	member.assigned_tasks
  end
end
