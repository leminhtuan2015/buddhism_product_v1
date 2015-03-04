class PhotosController < ApplicationController
  def new
    @photo_store = PhotoStore.find params[:photo_store_id]
    @album = Album.find params[:album_id]
  end

  def create
    @photo_store = PhotoStore.find params[:photo_store_id]
    @album = Album.find params[:album_id]
    if params[:images]
      params[:images].each do |image|
      @photo = @album.photos.create photo_params
      @photo.url = image
      @photo.save
      end
    end
    redirect_to photo_store_album_path(@photo_store, @album)
  end

  def show
    @photo_store = PhotoStore.find params[:photo_store_id]
    @album = Album.find params[:album_id]
    @photo = Photo.find params[:id]
  end

  def edit
    @photo_store = PhotoStore.find params[:photo_store_id]
    @album = Album.find params[:album_id]
    @photo = Photo.find params[:id]
  end

  def update
    @photo_store = PhotoStore.find params[:photo_store_id]
    @album = Album.find params[:album_id]
    @photo = @album.photos.find params[:id]
    if @photo.update_attributes photo_params
      redirect_to photo_store_album_photo_path(@photo_store, @album, @photo)
    else
      render 'edit'
    end
  end

  def destroy
    @photo_store = PhotoStore.find params[:photo_store_id]
    @album = Album.find params[:album_id]
    @photo = Photo.find params[:id]
    @photo.destroy
    redirect_to photo_store_album_path(@photo_store, @album)
  end

  private
  def photo_params
      params.require(:photo).permit(:name, :description, :url)
  end
end