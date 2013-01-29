class Member
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :semester, type: Integer
  field :major, type: String
  field :committee, type: String
  field :role, type: Integer

  #freeSessions
  
  #Author Diab
    #start
  has_and_belongs_to_many :courses
  has_many :sessions
  has_and_belongs_to_many :needed_requests, class_name: "Request", inverse_of: :needers
  has_many :assigned_requests, class_name: "Request", inverse_of: :assigned
    #end

  has_many :sarted_meetings, class_name: "Meeting", inverse_of: :creator
  has_and_belongs_to_many :attending_meetings, class_name: "Meeting", inverse_of: :attendees

  has_many :created_tasks, class_name: "Task", inverse_of: :created_by
  has_many :assigned_tasks, class_name: "Task", inverse_of: :assigned_to


  def get_pending_requests
    r = Request.where(:assigned => self , :done => false)
    return r
  end

  def get_done_requests
    r = Request.where(:assigned => self , :done => true)
    return r
  end  

  def reply_request(request , assigned_room)
    request.room = assigned_room
    #send_notification(request.needers)
  end
=begin
  This Method to get the members who teach a certain semester
  Author : Diab
  Committee/Project : Academics  
=end
  def self.get_members_teach_semester(s)
    cor = Course.where(:semester => s)
    mem = []
    cor.each do |c|
      mem << Member.where(:courses.include? c)
    end   

    return mem 
  end

=begin
  This Method to get the members who teach a certain course
  Author : Diab
  Committee/Project : Academics  
=end
  def self.get_members_teach_course(c)
    
    mem = Member.where(:courses.include? c)
    
    return mem 
  end

end
