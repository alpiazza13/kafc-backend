class Scoring::TeamSvc
    def self.call(team,match)
        Player.where(team_id: team.id)
        all_players = Player.where(team_id: team.id)
        if all_players == []
            return 0
        else
            (all_players.map {|player_| Scoring::PlayerSvc.call(player_,match)}).reduce(:+)
        end
    end
end