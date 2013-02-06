class Member
  include Mongoid::Document
  include Mongoid::Timestamps
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String


  field :name, type: String
  #field :email, type: String
  field :semester, type: Integer
  field :major, type: String
  field :committee, type: String
  field :role, type: String

  #freeSessions
  
  #Author Diab
    #start
  has_and_belongs_to_many :courses
  has_many :sessions
  has_many :notifications
  has_and_belongs_to_many :needed_requests, class_name: "Request", inverse_of: :needers
  has_many :assigned_requests, class_name: "Request", inverse_of: :assigned
    #end

  has_many :created_meetings, class_name: "Meeting", inverse_of: :creator
  has_and_belongs_to_many :attending_meetings, class_name: "Meeting", inverse_of: :attendees

  embeds_many :created_tasks, class_name: "Task", inverse_of: :created_by
  embeds_many :assigned_tasks, class_name: "Task", inverse_of: :assigned_to

  belongs_to :hcommittee, class_name: "Committee", inverse_of: :head
  belongs_to :vcommittee, class_name: "Committee", inverse_of: :vices
  belongs_to :committee, class_name: "Committee", inverse_of: :members
=begin
  This Method to get the pending requests assigned to this member
  Author:Diab
  Committee/Project : Logistics
=end
  def get_pending_requests
    r = Request.where(:assigned => self , :done => false).to_a
    return r
  end

=begin
  This Method to get the done requests assigned to this member
  Author:Diab
  Committee/Project : Logistics
=end
  def get_done_requests
    r = Request.where(:assigned => self , :done => true).to_a
    return r
  end  

=begin
  This Method to reply to a pending request with the room that has been reserved
  Author:Diab
  Committee/Project : Logistics
=end
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
      Member.all.each do |m|
        if(m.courses.include? c)    
         mem <<  m
             end
          end 
          end  

    return mem 
  end

=begin
  This Method to get the members who teach a certain course
  Author : Diab
  Committee/Project : Academics  
=end
  def self.get_members_teach_course(c)
    
    #mem = Member.where(:courses.include? (c))
    #mem = Member.all
    mem = Array.new
    Member.all.each do |m|
        if(m.courses.include? c)    
         mem <<  m
             end
          end   
   return mem
  end

=begin
  This Method to create an Academic Session and send a request to Logistics
  to reserve a room for it
  Author : Diab
  Committee/Project : Academics
=end
  def create_session (c , m , t)
    s = Session.new
    s.course = c
    s.member = m
    t.timing = t
    s.save

    r = Request.new
    r.session = s
    r.session_type = 1
    r.done = false
    r.room = "TBD"
    r.assigned = Member.where(:role => 2 , :committee => "Logistics")
    r.save
    r.needers << self
    r.needers << t
  end

=begin
  This 8 Methods to get the all members categorized by committees
  Author : Omar
=end
  def getYesMembers
    return Member.where(:committee => 'Yes')
  end

  def getCareMembers
    return Member.where(:committee => 'Care')
  end

  def getGenehMember
    return Member.where(:committee => 'Geneh')
  end

  def getAcademicsMembers
    return Member.where(:committee => 'Academics')
  end
    
  def getFRMembers
    return Member.where(:committee => 'FR')
  end

  def getPRMembers
    return Member.where(:committee => 'PR')
  end

  def getHRMembers
    return Member.where(:committee => 'HR')
  end

  def getITMembers
    return Member.where(:committee => 'IT')
  end

end
