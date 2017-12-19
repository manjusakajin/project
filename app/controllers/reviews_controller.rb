class ReviewsController < ApplicationController
  before_action :logged_in_user, except: [:show, :index]
  before_action :find_book, except: [:index]
  before_action :find_review, only: [:edit, :update, :destroy]

  def index
    if params[:search]
      @reviews = Review.where(title: params[:search]).paginate page: params[:page],
      per_page: Settings.per_page
    else
    @reviews = Review.all.paginate page: params[:page],
      per_page: Settings.per_page
    end
  end

  def show
    @review = Review.find_by id: params[:id]
    unless @review
      flash[:danger] = t "review.not_found"
      redirect_to root_url
    end
  end

  def new
    if current_user.reviewed? @book
      flash[:danger] = t "review.fobid"
      redirect_to root_url
    else
      @review = Review.new
    end
  end

  def create
    @review = current_user.reviews.new review_params
    @review.book_id = @book.id
    if @review.save
      flash[:success] = t "review.created"
      redirect_to book_review_path @book, @review
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update_attributes review_params
      flash[:success] = t "review.updated"
      redirect_to book_review_path @book, @review
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    flash[:success] = t "review.deleted"
    redirect_to root_url
  end

  private

  def review_params
    params.require(:review).permit :title, :content
  end

  def find_book
    @book = Book.find params[:book_id]
    unless @book
      flash[:danger] = t "danger.find_book", param: params[:book_id]
      redirect_to root_path
    end
  end

  def find_review
    @review = current_user.reviews.find_by id: params[:id]
    unless @review
      flash[:danger] = t "danger.access"
      redirect_to root_path
    end
  end
end
