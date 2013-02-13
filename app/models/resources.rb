class Resources
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :item, type:String
  field :price, type:Integer
  field :store_name, type:String
  field :store_address, type:String
  field :contact_name, type:String
  field :contact_number, type:Integer
  field :comments, type:String
end
