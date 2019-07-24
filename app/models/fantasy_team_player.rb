class FantasyTeamPlayer < ApplicationRecord
    validates :player_id, presence: true
    validates :user_team_id, presence: true

    belongs_to :player, optional: true
    belongs_to :user_team, optional: true

    has_many :player_stats, through: :player

    # has_one :real_team, through: :player
end
