class Event
  include Mongoid::Document
  include Mongoid::Search
  include Mongoid::Timestamps
  include Mongoid::Taggable

  ##FIELDS
  field :approved, type: Boolean

  # header
  field :title, type: String
  field :description, type: String
  field :date , type: Date, default: Date.today
  field :duration, type: Integer
  field :general_info, type: String

  # marketing campaign
  field :slogan, type: String
  field :attention_getter, type: String
  field :social_media, type: String
  field :booth_message, type: String

  #materials
  field :materials_delivered, type: Array, default: []

  ##RELATIONS
  belongs_to :event_manager, class_name: "Member", inverse_of: :managed_events
  has_one :logo
  has_one :booth
  has_many :posters

  search_in :title, :description

  accepts_nested_attributes_for :logo, :booth, :posters

  def self.list_project_manager_options
    Member.list_members_id_name
  end
end
