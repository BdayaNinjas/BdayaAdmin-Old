class Member
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :semester, type: Integer
  field :major, type: String
  field :committee, type: String

  #freeSessions
  #has_many courses
end
