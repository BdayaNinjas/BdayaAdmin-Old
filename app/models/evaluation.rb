class Evaluation
  include Mongoid::Document
  include Mongoid::Timestamps

  field :criteria1, type:Integer
  field :criteria2, type:Integer
  field :criteria3, type:Integer
  field :criteria4, type:Integer
  field :criteria5, type:Integer
  field :criteria6, type:Integer

  belongs_to :member, class_name: "Member", inverse_of: :evaluations
end