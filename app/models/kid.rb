class Kid
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :age, type: Integer
  field :address, type: String
  field :notes, type: String
end
