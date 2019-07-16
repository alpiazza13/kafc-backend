class Match < ApplicationRecord
    belongs_to :home_team, foreign_key: :home_team_id, class_name: 'Team'
    belongs_to :away_team, foreign_key: :away_team_id, class_name: 'Team'

    validates :home_team, presence: true
    validates :away_team, presence: true

    has_many :player_stats
    has_many :players, through: :player_stats
    has_many :stats, through: :player_stats

    def all_goals
        goal_id = Stat.find_by(stat_name: 'Goal').id
        PlayerStat.where("stat_id = ? and match_id = ?", goal_id, id)
    end

    def home_team_score
        goals = all_goals
        goals.select {|goal| goal.team.id == self.home_team_id}.size
    end

    def away_team_score
        goals = all_goals
        goals.select {|goal| goal.team.id == self.away_team_id}.size
    end

    def score
        "#{self.home_team.name} : #{self.home_team_score} vs #{self.away_team.name} : #{self.away_team_score}"
    end

    def winner
        if self.home_team_score > self.away_team_score
            "#{self.home_team.name} wins!!!"
        elsif self.home_team_score < self.away_team_score
            "#{self.away_team.name} wins!!!"
        else
            "It's a draw!"
        end
    end

end
