class Api::V1::PositionsController < ApplicationController
    def index
        @positions = Position.all.first(25)
    end
  end