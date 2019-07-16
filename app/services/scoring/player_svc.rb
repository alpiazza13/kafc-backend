class Scoring::PlayerSvc
    #calculates the points earned by player in match
    def self.call(player, match)
        only_stats = PlayerStat.where(match_id: match.id, player_id: player.id).pluck(:stat_id)
        Stat.where(id: only_stats).sum(:points)
    end
end
