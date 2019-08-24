class Player < ApplicationRecord
    belongs_to :team, optional: true
    belongs_to :position, optional: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validate :validate_team_type

    has_many :player_stats
    has_many :matches, through: :player_stats
    has_many :stats, through: :player_stats

    def validate_team_type
     valid = team.present? ? team.type == 'RealTeam' : true
     errors.add(:team, 'Player must belong to a real team') unless valid
    end
end
