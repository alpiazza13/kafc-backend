class Player < ApplicationRecord
    belongs_to :team, optional: true
    belongs_to :position, optional: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    # has_many :player_stats
    # has_many :matches, through: :player_stats
    # has_many :stats, through: :player_stats
end
