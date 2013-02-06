class TeamEvaluation < Evaluation
	include Mongoid::Document
	include Mongoid::Timestamps

	field :team_criteria1, type:Integer
	field :team_criteria2, type:Integer
	field :team_criteria2, type:Integer

end