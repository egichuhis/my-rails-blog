class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :find_post_and_user

  def index
    comments = @post.comments

    respond_to do |format|
      format.html
      format.json { render json: comments }
    end
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_post_path(@user, @post), notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created }
      else
        format.html { redirect_to user_post_path(@user, @post), alert: 'Comment creation failed.' }
        format.json { render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    redirect_to user_post_path(@user, @post), notice: 'Comment was successfully deleted.'
  end

  private

  def find_post_and_user
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
