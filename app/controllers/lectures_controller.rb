class LecturesController < ApplicationController
  def new
    @lecture_store = LectureStore.find params[:lecture_store_id]
  end

  def create
    @lecture_store = LectureStore.find params[:lecture_store_id]
    @lecture = @lecture_store.lectures.create lecture_params

     @newfeed = Newfeed.new
     @newfeed.lecture_id = @lecture.id
     @newfeed.save

    redirect_to lecture_store_path params[:lecture_store_id]
  end

  def show
    @lecture = Lecture.find params[:id]
  end

  def edit
    @lecture_store = LectureStore.find params[:lecture_store_id]
    @lecture = @lecture_store.lectures.find params[:id]
  end

  def update
    @lecture_store = LectureStore.find params[:lecture_store_id]
    @lecture = @lecture_store.lectures.find params[:id]
    if @lecture.update_attributes lecture_params
      redirect_to lecture_store_lecture_path(@lecture_store, @lecture)
    else
      render 'edit'
    end
  end

  def destroy
    @lecture = Lecture.find params[:id]
    @lecture.destroy
    redirect_to lecture_store_path @lecture.lecture_store
  end

  private
  def lecture_params
      params.require(:lecture).permit(:name, :description, :author, :url)
  end
end
