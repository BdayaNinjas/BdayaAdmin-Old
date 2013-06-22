class Criterium
  include Mongoid::Document

  has_many :ratings
  belongs_to :event_item

  field :name,      type: String

  def rating
    count = ratings.count
    return 0 if count == 0
    sum = 0.0
    ratings.each do |rating|
      sum += rating.value
    end
    avg = sum/count
    '%.1f' % avg
  end

  def add_rating user_id, value 
    rating = ratings.find_or_initialize_by(member_id: user_id)
    rating.update_attribute(:value,value)
  end

  def user_rating user_id
    rating = self.ratings.find_by member_id: user_id
    rating ? rating.value : 0
  end
end
