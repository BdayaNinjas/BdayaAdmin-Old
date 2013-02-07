class Member
  include Mongoid::Document
  include Mongoid::Timestamps
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time
  field :invitation_token
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

  has_many :created_tasks, class_name: "Task", inverse_of: :created_by
  has_many :assigned_tasks, class_name: "Task", inverse_of: :assigned_to
  field :invitation_sent_at

  belongs_to :hcommittee, class_name: "Committee", inverse_of: :head
  belongs_to :vcommittee, class_name: "Committee", inverse_of: :vices
  belongs_to :committee, class_name: "Committee", inverse_of: :members

  has_many :evaluations, class_name: "Evaluation", inverse_of: :member
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
    request.done = true
    request.save
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
  This Method to get the members who teach a certain major
  Author : Diab
  Committee/Project : Academics  
=end
  def self.get_members_teach_major(m)
    
    cor = Course.where(:major => m)
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
  This 8 Methods to get the all members categorized by committees
  Author : Omar
=end

  def self.getYesMembers
    return Committee.find_by(name: "Yes").members
  end

  def self.getCareMembers
    return Committee.find_by(name: "Yes").members
  end

  def self.getGenehMembers
    return Committee.find_by(name: "Geneh").members
  end

  def self.getAcademicsMembers
    return Committee.find_by(name: "Academics").members
  end
  
  def self.getTeamMembers
    return Committee.find_by(name: "Team").members
  end
    
  def self.getFRMembers
    return Committee.find_by(name: "FR").members
  end

  def self.getPRMembers
    return Committee.find_by(name: "PR").members
  end

  def self.getHRMembers
    return Committee.find_by(name: "HR").members
  end

  def self.getITMembers
    return Committee.find_by(name: "IT").members
  end

  def self.getCommitteeMembers (committee_name)
    return Committee.find_by(name: committee_name).members
  end
  

end
