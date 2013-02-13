class Materials
  include Mongoid::Document
  include Mongoid::Timestamps

  field :item, type:String
  field :quantity, type:Integer
  field :location, type:String
  field :contact_name, type:String
  field :mobile, type:Integer
  
end
