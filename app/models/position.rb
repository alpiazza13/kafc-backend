class Position < ApplicationRecord
    validates :player_position, presence: true
end