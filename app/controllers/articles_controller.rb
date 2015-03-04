class ArticlesController < ApplicationController
  def new
    @article_store = ArticleStore.find params[:article_store_id]
  end

  def create
    @article_store = ArticleStore.find params[:article_store_id]
    @article = @article_store.articles.create article_params

     @newfeed = Newfeed.new
     @newfeed.article_id = @article.id
     @newfeed.save

    redirect_to article_store_path params[:article_store_id]
  end

  def show
    @article = Article.find params[:id]
  end

  def edit
    @article_store = ArticleStore.find params[:article_store_id]
    @article = @article_store.articles.find params[:id]
  end

  def update
    @article_store = ArticleStore.find params[:article_store_id]
    @article = @article_store.articles.find params[:id]
    if @article.update_attributes article_params
      redirect_to article_store_article_path(@article_store, @article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find params[:id]
    @article.destroy
    redirect_to article_store_path @article.article_store
  end

  private
  def article_params
      params.require(:article).permit(:name, :description,
        :image_link, :image_upload, :author, :translator, :content)
  end
end
