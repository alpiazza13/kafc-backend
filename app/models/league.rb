class League < ApplicationRecord
    validates :name, presence: true

    belongs_to :manager, foreign_key: :manager_id, class_name: 'User'

    has_many :teams, class_name: 'FantasyTeam'
end
