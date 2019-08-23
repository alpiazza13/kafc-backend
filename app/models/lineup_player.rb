class LineupPlayer < ApplicationRecord
    validates :player_id, presence: true
    validates :lineup_id, presence: true
    validates :position_id, presence: true

    belongs_to :player
    belongs_to :lineup
    belongs_to :position
        
end
