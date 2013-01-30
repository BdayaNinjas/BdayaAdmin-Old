class Sponser
  include Mongoid::Document
  field :company, type: String
  field :person, type: String
  field :phone, type: String
  field :email, type: String
  field :address, type: String
  field :comments, type: String
end
