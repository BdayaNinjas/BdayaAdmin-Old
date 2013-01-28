class Member
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :semester, type: Integer
  field :major, type: String
  field :committee, type: String
  field :role, type: Integer

  embedded_in :creates, class_name: "Task", inverse_of: :created_by
  embeds_many :has, class_name: "Task", inverse_of: :assigned_to

  #freeSessions
  has_and_belongs_to_many :courses
  has_many :sessions
  has_and_belongs_to_many :needed_requests, class_name: "Request", inverse_of: :needers
  has_many :assigned_requests, class_name: "Request", inverse_of: :assigned

end
