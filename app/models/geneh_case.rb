class GenehCase
  include Mongoid::Document
  include Mongoid::Timestamps

  field :case_name, type: String
  field :description, type: String
  field :phone, type: String
  field :address, type: String
  field :case_number, type: Integer
  field :notes, type: String

  belongs_to :creator, class_name: "Member", inverse_of: :created_geneh_cases
  has_and_belongs_to_many :responsible_people, class_name: "Member", inverse_of: :responsible_geneh_case
end
