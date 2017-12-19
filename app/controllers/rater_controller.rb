class RaterController < ApplicationController
  def create
    if logged_in?
      obj = params[:klass].classify.constantize.find params[:id]
      obj.rate params[:score].to_f, current_user, params[:dimension]
      render json: true
      respond_to do |format|
        format.html { redirect_to @book }
        format.js
      end
    else
      render json: false
    end
  end
end
