class Committee
	Include Mongoid::Document
	Include Mongoid::Timestamps

  	field :name, type:String
  	filed :type, type:Integer

 has_one :head, class_name: "Member", inverse_of: :hcommittee
 has_many :vices, class_name: "Member", inverse_of: :vcommittee
 has_many :members, class_name: "Member", inverse_of: :committee
