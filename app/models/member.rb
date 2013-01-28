class Member
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :semester, type: Integer
  field :major, type: String
  field :committee, type: String

  embedded_in :creates, class_name: "Task", inverse_of: :created_by
  embeds_many :has, class_name: "Task", inverse_of: :assigned_to

  #freeSessions
  #has_many courses
end
