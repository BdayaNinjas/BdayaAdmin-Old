class Image
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Paperclip

  #has_mongoid_attached_file :image, styles: { small: '100>', medium: '250>', large: '666>'}
  mount_uploader :event_image, ImageUploader
  belongs_to :event_item
  belongs_to :event_day
  belongs_to :member

  field :accepted,    type: Boolean

  def image
    self.event_image
  end
end
