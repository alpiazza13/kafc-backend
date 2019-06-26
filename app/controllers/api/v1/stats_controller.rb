class Api::V1::StatsController < ApplicationController
  def index
      @stats = Stat.all.first(25)
  end
end
