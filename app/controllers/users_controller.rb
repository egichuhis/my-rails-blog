# users_controller.rb

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # Placeholder, no actual logic for now
  end
end
