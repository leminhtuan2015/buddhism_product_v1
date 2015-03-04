class ArticleStoresController < ApplicationController
 def index
 end

 def new
 	@article_store = ArticleStore.new
 end

def create
  @article_store = ArticleStore.new article_store_params
  if @article_store.save
    redirect_to root_path
  else
    flash[:danger] = "Create fails, please retry."
    render 'new'
  end
end

def show
  @article_store = ArticleStore.find params[:id]
  @articles = @article_store.articles.order('created_at DESC').paginate(page: params[:page], per_page: 10)
end

def edit
  @article_store = ArticleStore.find params[:id]
end

def update
  @article_store = ArticleStore.find params[:id]
  if @article_store.update_attributes article_store_params
      redirect_to article_store_path(@article_store)
  else
      render 'edit'
  end
end

def destroy
  @article_store = ArticleStore.find params[:id]
  @article_store.destroy
  redirect_to root_path
end

private
def article_store_params
  params.require(:article_store).permit(:name, :description)
end

end