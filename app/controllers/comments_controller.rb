class CommentsController < ApplicationController
  before_action :find_post_and_user

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment was successfully created.'
    else
      # Handle validation errors or other failure scenarios
      redirect_to user_post_path(@user, @post), alert: 'Comment creation failed.'
    end
  end

  private

  def find_post_and_user
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
