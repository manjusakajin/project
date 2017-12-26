class SessionsController < ApplicationController
  def new
  end

  def create
      if request.env['omniauth.auth']
        user = User.from_omniauth(env["omniauth.auth"])
        session[:user_id] = user.id
        redirect_to root_url
      else
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
        if user.activated?
          log_in user
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)
          redirect_back_or user
        else
          flash[:warning] = t ("warning.activation")
          redirect_to root_url
      end
    end
      end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
