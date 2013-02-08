class Session
  include Mongoid::Document
  field :timing, type: Time
  field :notes, type: String
  field :performance, type: Integer
  field :notes, type: String
  field :room
  field :assigned_teachers , type: Array

  belongs_to :member
  belongs_to :course
  has_one :request

  belongs_to :friday , class_name: "CareFriday" , inverse_of: :sessions

=begin
	This Method to list all Sessions Descending order
	Author : Diab
  Committee/Project : Academics
=end
  def self.get_sessions_date_desc
  	Session.desc(:timing).to_a
  end

=begin
  This Method to create an Academic Session and send a request to Logistics
  to reserve a room for it
  Author : Diab
  Committee/Project : Academics
=end
  def self.create_session (c , m , t , n)
    s = Session.new
    s.course = c
    s.member = m
    s.timing = t
    s.save

    r = Request.new
    r.session = s
    r.session_type = 1
    r.done = false
    r.room = "TBD"
    r.assigned = Committee.find_by(:name => "Logistics").head
    r.save
    r.needers << Committee.find_by(:name => "Academics").head
    r.needers << t
  end
   
end
