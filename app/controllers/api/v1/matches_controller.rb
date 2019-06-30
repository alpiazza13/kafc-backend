class Api::V1::MatchesController < ApplicationController
    def index
        @matches = Match.all.first(25)
    end
end
