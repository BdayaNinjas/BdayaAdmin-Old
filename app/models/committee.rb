class Committee
  include Mongoid::Document

  field :name, type:String
  field :type, type:Integer
	field :evaluation_criteria, type:Array

	has_one :head, class_name: "Member", inverse_of: :hcommittee
	has_many :vices, class_name: "Member", inverse_of: :vcommittee
	has_many :members, class_name: "Member", inverse_of: :committee

end