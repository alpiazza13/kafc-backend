class Team < ApplicationRecord
    validates :name, presence: true
    # has_many :players
    # has_many :matches
    # has_many :player_stats, through: :matches
    # has_many :stats, through: :player_stats
    # not sure about the two commented lines
