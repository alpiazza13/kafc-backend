class TeamsController < ApplicationController
  def index
      @teams = Team.all.first(25)
  end
end
