class NewsController < ApplicationController
  def index
    @newses = News.order('id DESC')
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new news_params
    if @news.save

     @newfeed = Newfeed.new
     @newfeed.news_id = @news.id
     @newfeed.save

      redirect_to news_index_path
    else
    	flash[:danger] = "Create fails, please retry."
      render 'new'
    end
  end

  def show
    @news = News.find params[:id]
  end

  def edit
    @news = News.find params[:id]
  end

  def update
    @news = News.find params[:id]
    if @news.update_attributes news_params
      redirect_to news_index_path
    else
      render 'edit'
    end
  end

  def destroy
    @news = News.find params[:id]
    @news.destroy
    redirect_to news_index_path
  end

  private
  def news_params
    params.require(:news).permit(:name, :content, :during, :place, :description, :image_link, :image_upload)
  end
end