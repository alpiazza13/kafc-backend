class FantasyTeamPlayer < ApplicationRecord
    validates :player_id, presence: true
    validates :user_team_id, presence: true

    belongs_to :player, optional: true
    belongs_to :user_team, optional: true
end
