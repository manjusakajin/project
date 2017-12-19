class Admin::UsersController < ApplicationController
  before_action :admin_user
  before_action :logged_in_user
  before_action :find_user

  def update
    if @user.update_attributes(admin: true)
      flash[:success] = "Success"
      redirect_to users_url
    else
      flash[:danger] = "Set Admin Fail"
      redirect_to users_url
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t "user.delete_success"
    redirect_to users_url
  end

  private

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def find_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "danger.not_found"
      redirect_to root_url
    end
  end
end
