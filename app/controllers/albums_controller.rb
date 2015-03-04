class AlbumsController < ApplicationController
   def new
    @photo_store = PhotoStore.find params[:photo_store_id]
  end

  def create
    @photo_store = PhotoStore.find params[:photo_store_id]
    @album = @photo_store.albums.create album_params
     
     @newfeed = Newfeed.new
     @newfeed.album_id = @album.id
     @newfeed.save

    redirect_to photo_store_path params[:photo_store_id]
  end

  def show
    @photo_store = PhotoStore.find params[:photo_store_id]
    @album = Album.find params[:id]
    @photos = @album.photos.order('created_at DESC').paginate(page: params[:page], per_page: 20)
  end

  def edit
    @photo_store = PhotoStore.find params[:photo_store_id]
    @album = @photo_store.albums.find params[:id]
  end

  def update
    @photo_store = PhotoStore.find params[:photo_store_id]
    @album = @photo_store.albums.find params[:id]
    if @album.update_attributes album_params
      redirect_to photo_store_album_path(@photo_store, @album)
    else
      render 'edit'
    end
  end

  def destroy
    @album = Album.find params[:id]
    @album.destroy
    redirect_to photo_store_path @album.photo_store
  end

  private
  def album_params
      params.require(:album).permit(:name, :description)
  end
end
