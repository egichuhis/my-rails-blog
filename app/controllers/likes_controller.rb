class LikesController < ApplicationController
  before_action :find_post_and_user

  def create
    @like = @post.likes.build
    @like.user = current_user

    if @like.save
      redirect_to user_post_path(@user, @post), notice: 'Like was successfully created.'
    else
      # Handle validation errors or other failure scenarios
      redirect_to user_post_path(@user, @post), alert: 'Like creation failed.'
    end
  end

  private

  def find_post_and_user
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end
end
