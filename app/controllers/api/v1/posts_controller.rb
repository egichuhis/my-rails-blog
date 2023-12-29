module Api
  module V1
    class PostsController < ApplicationController
      def index
        user = User.find(params[:user_id])
        posts = user.posts.includes(:comments)
        render json: posts, include: 'comments'
      end
    end
  end
end
