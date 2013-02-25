class Calendar
  include Mongoid::Document
  include Mongoid::Timestamps

  field :committee , type: String
  field :events, type: Hash , default: {}

  before_create -> { self.initialize_calendar! }
  #author: mehrez
  #this method initializes the calendar on creation , creates a hash; each key represent the day
  def initialize_calendar!
    hash = {}
    for i in 1..31
      hash.merge!({"#{i}" => ""})
      i = i + 1
    end
    self.events = hash
  end
end
