# posts_controller.rb

class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @all_comments = @post.comments
    @recent_comments = @post.recent_comments
  end
end
