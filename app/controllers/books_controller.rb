class BooksController < ApplicationController
  before_action :authenticate_author!

  def index
    @books = Book.all

    respond_to do |format|
      format.html { }
      format.json { render :json => @books }
    end
  end

  def new
    @book = Book.new
    @book.author_id = current_author.id
  end

  def create
    @book = Book.new book_params
    @book.author_id = current_author.id

    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  def edit
    @book = Book.find params[:id]
  end

  def show
    @book = Book.find params[:id]

  end

  def update
    book = Book.find params[:id]
    book.update book_params

    redirect_to book
  end

  def destroy
    book = Book.find params[:id]
    book.destroy

    flash[:notice] = "The book is now deleted. "
    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :author_id)
    end
end
