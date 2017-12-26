class Admin::BooksController < ApplicationController
  before_action :check_login
  before_action :check_admin
  before_action :find_book, only: [:edit, :update, :destroy]
  before_action :upload_image, only: [:create, :update]

  def new
    @book = Book.new
    @genres = Genre.all
  end

  def edit
    @genres = Genre.all
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t "success.book"
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    if @book.update_attributes book_params
      flash[:success] = t "success.update"
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:success] = t "book.delete"
    redirect_to books_url
  end

  private

  def book_params
    params.require(:book).permit :name, :introdution, :web_ratting,
      :image, :remove_image, :image_cache,
      :remote_image_url,
      genre_ids: [],genres_attributes:[:name]
  end

  def check_admin
    unless current_user.admin?
      flash[:danger] = t "danger.create_book"
      redirect_to root_url
    end
  end

  def check_login
    unless logged_in?
      flash[:danger] = t "danger.login"
      redirect_to login_path
    end
  end

  def find_book
    @book = Book.find_by id: params[:id]
    unless @book
      flash[:danger] = t "danger.book"
      redirect_to root_url
    end
  end

  def upload_image
    if(params[:book][:image])
        Cloudinary::Uploader.upload(params[:book][:image])
      else
        if(params[:book][:remote_image_url])
        Cloudinary::Uploader.upload(params[:book][:remote_image_url])
        end
    end
  end
end
