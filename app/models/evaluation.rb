class Evaluation
  include Mongoid::Document
  include Mongoid::Timestamps

  #embeds_many :criteria, cascade_callbacks: true

    field :criteria1, type:Integer, :default => 0
 	field :criteria2, type:Integer, :default => 0
 	field :criteria3, type:Integer, :default => 0
 	field :criteria4, type:Integer, :default => 0
 	field :criteria5, type:Integer, :default => 0
 	field :criteria6, type:Integer, :default => 0
 	field :criteria7, type:Integer, :default => 0
 	field :criteria8, type:Integer, :default => 0
 	field :criteria9, type:Integer, :default => 0
 	field :criteria10, type:Integer, :default => 0

 	# field :
	belongs_to :member, class_name: "Member", inverse_of: :evaluations

	def evaluate
		
	end

end