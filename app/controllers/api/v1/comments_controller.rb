# app/controllers/api/v1/comments_controller.rb
module Api
  module V1
    class CommentsController < ApplicationController
      before_action :find_post_and_user, only: %i[index create]

      def index
        comments = @post.comments
        render json: comments
      end

      def create
        comment = @post.comments.build(comment_params)
        comment.user = current_user

        if comment.save
          render json: comment, status: :created
        else
          render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
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
  end
end
