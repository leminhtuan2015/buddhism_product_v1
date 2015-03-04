class BookStoresController < ApplicationController
  def index
  end

  def new
    @book_store = BookStore.new
  end

  def create
    @book_store = BookStore.new book_store_params
    if @book_store.save
      redirect_to root_path
    else
      flash[:danger] = "Create fails, please retry."
      render 'new'
    end
  end

  def show
    @book_store = BookStore.find params[:id]
    @books = @book_store.books.order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end

  def edit
    @book_store = BookStore.find params[:id]
  end

  def update
    @book_store = BookStore.find params[:id]
    if @book_store.update_attributes book_store_params
     redirect_to book_store_path(@book_store)
    else
      render 'edit'
    end
  end

  def destroy
    @book_store = BookStore.find params[:id]
    @book_store.destroy
    redirect_to root_path
  end

  private
  def book_store_params
    params.require(:book_store).permit(:name, :description)
  end
end
