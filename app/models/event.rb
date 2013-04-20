class Event
  include Mongoid::Document
  include Mongoid::Search
  include Mongoid::Timestamps

  ##FIELDS
  field :title, type: String
  field :description, type: String
  field :date , type: DateTime
  field :duration, type: Integer
  field :approved, type: Boolean

  field :general_info, type: String

  ##RELATIONS
  belongs_to :event_manager, class_name: "Member", inverse_of: :managed_events

  search_in :title, :description
end
