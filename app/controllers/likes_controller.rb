class LikesController < ApplicationController
  before_action :find_user_and_post

  def create
    @like = current_user.likes.build(post: @post)

    if @like.save
      redirect_to user_post_path(@user, @post), notice: 'Like was successfully created.'
    else
      # Handle validation errors or other failure scenarios
      redirect_to user_post_path(@user, @post), alert: 'Like creation failed.'
    end
  end

  private

  def find_user_and_post
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
  end
end
