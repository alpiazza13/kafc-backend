class Player < ApplicationRecord
    belongs_to :team, optional: true
    belongs_to :position, optional: true
    validates :first_name, presence: true
    validates :last_name, presence: true
end
