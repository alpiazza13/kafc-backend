class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all.first(25)
  end
end
