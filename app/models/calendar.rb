class Calendar
  include Mongoid::Document

  include Mongoid::Document
  include Mongoid::Timestamps

  field :commitee , type: String
  field :events, type: Hash , default: {}

  before_create -> { self.initialize_calendar! }

  def initialize_calendar!
    hash = {}
    for i in 1..31
      hash.merge!({"#{i}" => ""})
      i = i + 1
    end
    self.events = hash
  end
end
