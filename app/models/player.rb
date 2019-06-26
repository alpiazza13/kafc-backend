class Player < ApplicationRecord
    belongs_to :team, optional: true
    validates :first_name, presence: true
    validates :last_name, presence: true
end
