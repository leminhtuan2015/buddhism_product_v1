class PhotoStoresController < ApplicationController
  def index
    @albums = Album.order('created_at DESC')
  end
  def new
    @photo_store = PhotoStore.new
  end

  def create
    @photo_store = PhotoStore.new photo_store_params
    if @photo_store.save
      redirect_to root_path
    else
      flash[:danger] = "Create fails, please retry."
      render 'new'
    end
  end

  def show
    @photo_store = PhotoStore.find params[:id]
    @albums = @photo_store.albums.order('created_at DESC').paginate(page: params[:page], per_page: 20)
  end

  def edit
    @photo_store = PhotoStore.find params[:id]
  end

  def update
    @photo_store = PhotoStore.find params[:id]
    if @photo_store.update_attributes photo_store_params
      redirect_to photo_store_path(@photo_store)
    else
      render 'edit'
    end
  end

  def destroy
    @photo_store = PhotoStore.find params[:id]
    @photo_store.destroy
    redirect_to root_path
  end

  private
  def photo_store_params
    params.require(:photo_store).permit(:name, :description)
  end
end