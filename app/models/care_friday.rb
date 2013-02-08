class CareFriday
  include Mongoid::Document

  field :date , type: Date
  field :materials
  field :schedule

  has_and_belongs_to_many :kids, class_name: "Kid", inverse_of: :fridays
  has_many :sessions, class_name: "Session" , inverse_of: :friday

end
