class BooksController < ApplicationController
def index
  if params[:search]
    @books = Book.where(name: params[:search]).paginate page: params[:page],
      per_page: 10
  else
    @books = Book.all.paginate page: params[:page],
      per_page: 10
  end
  end

  def show
    @book = Book.find_by id: params[:id]
    if @book
      @reviews = @book.reviews.order(created_at: :desc)
        .paginate page: params[:page], per_page: 10
    else
      flash[:danger] = t "book.not_found"
      redirect_to root_url
    end
  end
end
