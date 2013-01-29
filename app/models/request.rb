class Request
  include Mongoid::Document
  field :session_type, type: Integer
  field :timing, type: Time
  field :done , type: Boolean
  field :room , type: String

  has_and_belongs_to_many :needers, class_name: "Member", inverse_of: :needed_requests
  belongs_to :assigned, class_name: "Member", inverse_of: :assigned_requests

  belongs_to :session


end
