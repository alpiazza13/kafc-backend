class Stat < ApplicationRecord
    validates :stat_name, presence: true
    validates :points, presence: true

    # has_many :player_stats
    # has_many :players, through: :player_stats
    # has_many :matches, through: :player_stats



end
