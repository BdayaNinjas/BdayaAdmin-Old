class Trainer
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :phone, type: String
  field :email, type: String
  field :work_place, type: String
  field :topics, type: Array
end
