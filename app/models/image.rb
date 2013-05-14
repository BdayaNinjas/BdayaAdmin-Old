class Image
  include Mongoid::Document
  #include Mongoid::Paperclip

  #has_mongoid_attached_file :image, styles: { small: '100>', medium: '250>', large: '666>'}

  belongs_to :poster
  belongs_to :booth
  belongs_to :logo
end
