class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

end
