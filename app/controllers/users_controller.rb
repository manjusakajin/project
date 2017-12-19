class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :find_user, except: [:new, :create, :index]
  before_action :correct_user, only: [:edit, :update]

  def index
    if params[:search] == nil
    @users = User.where(activated: true).paginate(page: params[:page])
    else
    @users = User.where(activated: true,name: params[:search]).paginate(page: params[:page])
    end
  end

  def show
    if @user
      @reviews = @user.reviews.order(created_at: :desc)
        .paginate page: params[:page], per_page: Settings.per_page
      @relationship =
        if current_user.active_relationships.find_by followed_id: @user.id
          current_user.active_relationships.find_by followed_id: @user.id
        else
          current_user.active_relationships.build
        end
    else
      flash[:danger] = t "danger.not_found"

    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "info.activation"
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "success.update"
      redirect_to root_url
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def find_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "danger.not_found"
      redirect_to root_url
    end
  end

  def correct_user
    unless current_user.is_user? @user
      flash[:danger] = t "danger.correct_user"
      redirect_to root_url
    end
  end
end
