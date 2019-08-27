class Api::V1::PlayersController < ApplicationController
  def index
      binding.pry
      @players = Player.all.first(25)
  end
end
