class Stat < ApplicationRecord
    validates :stat_name, presence: true
    validates :points, presence: true

end
