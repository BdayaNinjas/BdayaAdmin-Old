class TrainingCompany
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :phone, type: String
  field :training_fields, type: Array
  field :contact_title, type: String
  field :contact_name, type: String
  field :contact_phone, type: String
  field :contact_email, type: String
end
