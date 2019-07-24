class UserTeam < ApplicationRecord
    validates :user_id, presence: true
    validates :team_id, presence: true

    belongs_to :user, optional: true
    belongs_to :team, optional: true
    has_many :fantasy_team_players
end
