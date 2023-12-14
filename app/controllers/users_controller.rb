# users_controller.rb

class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @users = User.all
    @post = Post.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts
  end
end
