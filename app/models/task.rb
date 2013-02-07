class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description, type:String
  field :excuse, type:String
  field :comment, type:String
  field :status, type: String, :default => "Not_done" # Not done, Done, Re-open
  field :deadline, type: Date
  field :requested_deadline, type: Date
  field :request, type:Boolean, :default => false

  #attr_accessor_with_default :status, "Not_done"


  belongs_to :created_by, class_name: "Member", inverse_of: :created_tasks
  belongs_to :assigned_to, class_name: "Member", inverse_of: :assigned_tasks

  def self.get_tasks (member)
  	member.assigned_tasks
  end

  # def update_status (comment)
  #   if (self.status == "Not_done" || self.status == "Re_opened")
  #       self.update_attributes (status: 'Done')
  #   else 
  #     self.update_attributes (status: 'Done', comment: comment)
  #   end
  # end
end
