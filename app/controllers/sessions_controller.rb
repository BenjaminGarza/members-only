# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_email(params[:session][:email])
    if user&.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:alert] = 'Invalid email or password combination.'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
