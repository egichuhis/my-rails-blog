# posts_controller.rb

class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    # Placeholder, no actual logic for now
  end
end
