class BooksController < ApplicationController
  def new
    @book_store = BookStore.find params[:book_store_id]
  end

  def create
    @book_store = BookStore.find params[:book_store_id]
    @book = @book_store.books.create book_params

     @newfeed = Newfeed.new
     @newfeed.book_id = @book.id
     @newfeed.save

    redirect_to book_store_path params[:book_store_id]
  end

  def show
    @book = Book.find params[:id]
  end

  def edit
    @book_store = BookStore.find params[:book_store_id]
    @book = @book_store.books.find params[:id]
  end

  def update
    @book_store = BookStore.find params[:book_store_id]
    @book = @book_store.books.find params[:id]
    if @book.update_attributes book_params
      redirect_to book_store_book_path(@book_store, @book)
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find params[:id]
    @book.destroy
    redirect_to book_store_path @book.book_store
  end

  private
  def book_params
      params.require(:book).permit(:name, :description,
        :image_link, :image_upload, :author, :translator, :content)
  end
end