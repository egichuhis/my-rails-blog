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

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment was successfully created.'
    else
      # Handle validation errors or other failure scenarios
      redirect_to user_post_path(@user, @post), alert: 'Comment creation failed.'
    end

    respond_to do |format|
      format.html { redirect_to user_post_path(@user, @post) }
      format.json do
        if comment.save
          render json: comment, status: :created
        else
          render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
        end
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
