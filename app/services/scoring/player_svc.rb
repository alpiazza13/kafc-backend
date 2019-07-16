class Scoring::PlayerSvc

    #calculates the points earned by player in match
    def self.call(player, match)

        #list of all stat_ids for player from match
        only_stats = PlayerStat.where(match_id: match.id, player_id: player.id).pluck(:stat_id)

        #list of the point value for each stat for plaeyr in match
        Stat.where(id: only_stats).sum(:points)
        # only_stats.map {|id|   Stat.find(id).points}

        #adds it up
        # stat_values.reduce { |tot, pt| tot + pt}

    end
end
