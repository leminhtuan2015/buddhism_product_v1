class News < ActiveRecord::Base
  mount_uploader :image_upload, PictureUploader
  has_many :newfeeds, :dependent => :destroy
end
