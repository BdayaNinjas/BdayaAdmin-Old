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
  has_many :created_tasks, class_name: "Task", inverse_of: :created_by
  has_many :assigned_tasks, class_name: "Task", inverse_of: :assigned_to

  has_and_belongs_to_many :courses
  has_many :sessions
  has_and_belongs_to_many :needed_requests, class_name: "Request", inverse_of: :needers
  has_many :assigned_requests, class_name: "Request", inverse_of: :assigned
    #end

=begin
  This Method to get the pending requests assigned to the member
  Author : Diab 
  Committee/Project : Logistics 
=end  
  def get_pending_requests
    r = Request.where(:assigned => self , :done => false)
  end

=begin
  This Method to get the done requests assigned to the member
  Author : Diab  
  Committee/Project : Logistics
=end  
  def get_done_requests
    r = Request.where(:assigned => self , :done => true)
  end  

=begin
  This Method to reply to a request with the room number
  Author : Diab  
  Committee/Project : Logistics
=end 
  def reply_request(request , assigned_room)
    request.room = assigned_room
    #send_notification(request.needers)
  end

end
