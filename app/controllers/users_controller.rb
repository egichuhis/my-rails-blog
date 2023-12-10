# users_controller.rb

class UsersController < ApplicationController
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
