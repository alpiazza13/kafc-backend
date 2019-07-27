class Team < ApplicationRecord
    validates :name, presence: true
    validates :type, presence: true, inclusion: { in: %w[FantasyTeam RealTeam] }
    has_many :players

    def matches
        Match.where("home_team_id = ? or away_team_id = ?", id, id)
    end

    has_many :player_stats, through: :players
    has_many :stats, through: :player_stats

end
