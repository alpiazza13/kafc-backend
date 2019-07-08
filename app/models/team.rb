class Team < ApplicationRecord
    validates :name, presence: true
    has_many :players
    has_many :matches
    has_many :player_stats, through: :matches
    has_many :stats, through: :player_stats
    # not sure about the above three lines. in fact, the matches relationship for teams doesn't work,
    # nor does the player_stats or stats of course. it seems to look for a team_id column in matches model when i 
    # call Team.first.matches, which doesn't exist (only home_team_id and away_team_id exist). Not sure how to fix
end
