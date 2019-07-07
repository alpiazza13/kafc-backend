class Api::V1::MatchesController < ApplicationController
    def index
        @matches = Match.eager_load(:home_team, :away_team).first(25)
    end
end
