class LectureStoresController < ApplicationController
  def index
  end

  def new
    @lecture_store = LectureStore.new
  end

  def create
    @lecture_store = LectureStore.new lecture_store_params
    if @lecture_store.save
      redirect_to root_path
    else
      flash[:danger] = "Create fails, please retry."
      render 'new'
    end
  end

  def show
    @lecture_store = LectureStore.find params[:id]
    @lectures = @lecture_store.lectures.order('created_at DESC').paginate(page: params[:page], per_page: 20)
  end

  def edit
    @lecture_store = LectureStore.find params[:id]
  end

  def update
    @lecture_store = LectureStore.find params[:id]
    if @lecture_store.update_attributes lecture_store_params
     redirect_to lecture_store_path(@lecture_store)
    else
      render 'edit'
    end
  end

  def destroy
    @lecture_store = LectureStore.find params[:id]
    @lecture_store.destroy
    redirect_to root_path
  end

  private
  def lecture_store_params
    params.require(:lecture_store).permit(:name, :description)
  end
end
