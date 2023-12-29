# controllers/users_controller.rb

class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @users = User.all
    @post = Post.new
    @user = current_user

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts

    respond_to do |format|
      format.html
      format.json { render json: @user, include: 'posts' }
    end
  end
end
