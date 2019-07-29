class Api::V1::UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @users = User.all.first(25)
  end
end
