class Notification
  include Mongoid::Document
  include Mongoid::Timestamps
  field :member1, type: Member
  field :member2, type: Member
  field :number, type: Integer
  field :type, type: Integer
  field :seen, type: Boolean
  field :desc, type: String


  belongs_to :member

def unseen(x)
    unseen = Array.new
    notifications = Member.where(:id => x).notifications
    notifications.each do |z|
        if(z.unseen == true)
            unseen << z
        end
    end
    return unseen
end

def all(x)
    return Member.where(:id => x).notifications
end

def set_seen
    self.seen = true
    self.save
end

   def self.send_notification(to,num,type,desc)
      n = Notification.new(member1:current_member, member2:to, number:num, type:type, desc: desc)
      n.save
      to.notifications << n
  end


end
