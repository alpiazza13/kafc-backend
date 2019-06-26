class Api::V1::PlayersController < ApplicationController
  def index
      @players = Player.all.first(25)
  end
end