class UserTeam < ApplicationRecord
    validates :user_id, presence: true
    validates :team_id, presence: true
    validate :validate_team_type

    belongs_to :user, optional: true
    belongs_to :team
    has_many :fantasy_team_players

    def validate_team_type
      team.present? && team.type == 'FantasyTeam'
    end
end
