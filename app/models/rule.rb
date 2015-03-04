class Rule < ActiveRecord::Base
  mount_uploader :image_upload, PictureUploader
  belongs_to :rule_store
  has_many :newfeeds, :dependent => :destroy
end
