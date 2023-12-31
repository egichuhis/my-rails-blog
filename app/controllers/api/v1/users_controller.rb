module Api
  module V1
    class UsersController < ApplicationController
      def show
        user = User.find(params[:id])
        render json: user, include: 'posts'
      end
    end
  end
end
