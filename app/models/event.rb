class Event
  include Mongoid::Document
  include Mongoid::Search
  include Mongoid::Timestamps

  

  ##FIELDS
  field :title, type: String
  field :description, type: String
  field :date , type: Date, default: Date.today
  field :duration, type: Integer
  field :approved, type: Boolean

  field :general_info, type: String

  ##RELATIONS
  belongs_to :event_manager, class_name: "Member", inverse_of: :managed_events
  has_one :logo
  has_one :booth
  has_many :posters

  search_in :title, :description

  accepts_nested_attributes_for :logo, :booth, :posters
end
