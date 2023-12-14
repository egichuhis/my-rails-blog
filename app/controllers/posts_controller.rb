# posts_controller.rb

class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @like = Like.new
    @all_comments = @post.comments
    @recent_comments = @post.recent_comments
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to user_post_path(current_user, @post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: 'Post was successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
