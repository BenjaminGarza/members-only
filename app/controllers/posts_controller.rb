# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :check_sign_in, only: %i[create new]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.user_id == current_user.id && @post.save
      redirect_to posts_path
    else
      @post.errors.add(:warning, 'Invalid User') unless @post.user_id == current_user.id
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  private

  def check_sign_in
    redirect_to root_path unless logged_in?
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
