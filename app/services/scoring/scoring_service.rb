class PlayerScoring::Service

    #calculates the points earned by player in match
    def self.call(player, match)

        #list of all of player's player_stats from match
        player_stats = match.player_stats.select {|stat| stat.player_id == player.id}

        #list of all stat_ids for player from match
        only_stats = player_stats.map {|player_stat| player_stat.stat_id}

        #list of the point value for each stat for plaeyr in match, just need to add it up
        stat_values = only_stats.map {|id|   Stat.where("id = ?", id).points}

        #adds it up
        stat_values.reduce { |tot, pt| tot + pt}

    end
end
