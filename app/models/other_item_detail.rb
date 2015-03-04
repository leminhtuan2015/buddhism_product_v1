class OtherItemDetail < ActiveRecord::Base
  mount_uploader :image_upload, PictureUploader
  belongs_to :other_item
  has_many :newfeeds, :dependent => :destroy
end
