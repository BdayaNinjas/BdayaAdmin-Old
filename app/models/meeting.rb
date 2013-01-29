class Meeting
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :meeting_minutes, type: Array
  field :room, type: String
  field :attendace, type: Array #Will be Entered as Array of 2D arrays in the form of [[Member,attendance_status],[Member,attendance_status],..]

  belongs_to :creator, class_name: "Member", inverse_of: :sarted_meetings
  has_and_belongs_to_many :attendees, class_name: "Member", inverse_of: :attending_meetings
end
