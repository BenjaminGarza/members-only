# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :sign_in_check, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  private

  def sign_in_check
    redirect_to root_url unless logged_in?
  end
end
