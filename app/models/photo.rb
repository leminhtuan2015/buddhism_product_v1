class Photo < ActiveRecord::Base
  mount_uploader :url, PictureUploader
  belongs_to :album

  def next album_id
    Photo.where(album_id: album_id).where("photos.id > ? ", self.id).order("photos.id ASC").limit(1)
  end

  def previous album_id
    Photo.where(album_id: album_id).where("photos.id < ?", self.id).order("photos.id DESC").limit(1)
end

end
