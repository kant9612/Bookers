class BooksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    blog = Book.new(blog_params)
    blog.save
    redirect_to books_path
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
