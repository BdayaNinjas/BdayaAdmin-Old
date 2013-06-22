class EventItem
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  field :description
  field :approved,    type: Boolean

  has_one :image
  has_many :criteria
  belongs_to :event

  after_create :init_criteria

  def init_criteria
    names = %w[Aim Goal Cause]
    3.times{ |i| self.criteria.create name: names[i]}
  end

  def add_criteria name
    self.criteria.create name: name
  end

  def rating
    sum = 0.0
    criteria.each do |crit|
      sum += crit.rating.to_f
    end
    avg = sum/criteria.count
    '%.1f' % avg
  end
end
