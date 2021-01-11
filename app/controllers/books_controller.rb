class BooksController < ApplicationController
  def top
    @book = Book.new
    @books = Book.all
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @books = Book.all
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "successfully created"
      redirect_to book_path(book)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "successfully edited"
      redirect_to book_path(book)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path(book.id)
  end

  private
  def book_params
    params.permit(:title, :body)
  end
end
