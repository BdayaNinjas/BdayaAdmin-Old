class Rating
  include Mongoid::Document
  field :value, type: Integer
  belongs_to :criterium
  belongs_to :member

end
