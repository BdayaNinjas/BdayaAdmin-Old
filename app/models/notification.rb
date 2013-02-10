class Notification
  include Mongoid::Document
  include Mongoid::Timestamps
  field :member1, type: String
  field :member2, type: String
  field :number, type: Integer
  field :type, type: Integer
  field :seen, type: Boolean
  field :desc, type: String
  field :ID, type: String



  belongs_to :member

  

  def set_seen
    self.seen = true
    self.save
  end

   def self.send_notification(to,num,type,desc)
      n = Notification.new
      n.member1 = current_member.id
      n.member2 = to.id
      n.type = type
      n.desc = desc
      n.seen = false
      n.save
      to.notifications << n
  end

=begin
 This Method to send a notification to all Heads from The HR head
 to remind them to Evaluate their Members
 Author : Diab
 Committee/Project : HR
=end
  def self.remind_heads_evaluate
    Committee.each do |com|
      if (com.name != "HR")
        Notification.send_notification(com.head,10,4,
          "The HR head is reminding you to evaluate your members")
      end
    end     
  end

end
