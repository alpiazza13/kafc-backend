class Lineup < ApplicationRecord
    validates :formation_id, presence: true

    belongs_to :user_team, optional: true
    belongs_to :formation, optional: true

    has_many :lineup_players
end
