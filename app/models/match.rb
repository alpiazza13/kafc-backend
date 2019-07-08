class Match < ApplicationRecord
    belongs_to :home_team, foreign_key: :home_team_id, class_name: 'Team'
    belongs_to :away_team, foreign_key: :away_team_id, class_name: 'Team'

    validates :home_team, presence: true
    validates :away_team, presence: true

    
end
