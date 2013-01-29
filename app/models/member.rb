class Member
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :semester, type: Integer
  field :major, type: String
  field :committee, type: String
  field :role, type: Integer

  has_many :created_tasks, class_name: "Task", inverse_of: :created_by
  has_many :assigned_tasks, class_name: "Task", inverse_of: :assigned_to

  has_many :sarted_meetings, class_name: "Meeting", inverse_of: :creator
  has_and_belongs_to_many :attending_meetings, class_name: "Meeting", inverse_of: :attendees

  #freeSessions
  has_and_belongs_to_many :courses
  has_many :sessions
  has_and_belongs_to_many :needed_requests, class_name: "Request", inverse_of: :needers
  has_many :assigned_requests, class_name: "Request", inverse_of: :assigned

end
