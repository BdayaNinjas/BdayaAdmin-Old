class Event
  include Mongoid::Document
  include Mongoid::Search
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :date , type: DateTime

  search_in :title, :description
end
