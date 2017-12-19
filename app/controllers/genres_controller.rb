class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find_by id: params[:id]
    if @genre
      @book_genres = @genre.book_genres
    else
      flash[:danger] = t "genre.not_found"
      redirect_to root_url
    end
  end

  def create
    @genre = Genre.new genre_name
    @genre.save
  end
end
