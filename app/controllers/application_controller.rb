# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def sign_in(user)
    session[:user_id] = user.id
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_digest
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    else
      set_current_user
    end
  end

  def current_user?(user)
    current_user == user
  end

  def set_current_user
    return unless (user_id = cookies.signed[:user_id])
    user = User.find_by(id: user_id)
    
    return unless user && authenticated?(cookies[:remember_token])
    sign_in user
    @current_user = user
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
    session.delete(:user_id)
    @current_user = nil
  end
end
