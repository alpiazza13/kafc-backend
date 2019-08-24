class Lineup < ApplicationRecord
    validates :formation, presence: true

    belongs_to :user_team, optional: true
    belongs_to :formation

    has_many :lineup_players
end
