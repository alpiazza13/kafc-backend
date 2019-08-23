namespace :kafc do
    desc 'generates development data'
    task generate_dev_data: :environment do

        pos1 = Position.find_or_create_by(name: "GK")
        pos2 = Position.find_or_create_by(name: "DEF")
        pos3 = Position.find_or_create_by(name: "MID")
        pos4 = Position.find_or_create_by(name: "FWD")
        pos5 = Position.find_or_create_by(name: "DEF/MID")
        pos6 = Position.find_or_create_by(name: "MID/FWD")

        stat = Stat.find_or_create_by(stat_name: 'Goal')
        stat.update_attribute(:points, 5)

        stat1 = Stat.find_or_create_by(stat_name: 'Assist')
        stat1.update_attribute(:points, 2)

        stat2 = Stat.find_or_create_by(stat_name: 'Red Card')
        stat2.update_attribute(:points, 100)

        stat3 = Stat.find_or_create_by(stat_name: 'Yellow Card')
        stat3.update_attribute(:points, -5)

        20.times do |i|
            email = "test-email#{i}@test.com"
            user = User.find_by(email: email)
            next if user.present? # if user.present, then next, else...
            Fabricate(:user, email: email, first_name: 'Kurt', last_name: "Zouma#{i}000")
        end

        20.times do |i|
            RealTeam.find_or_create_by(
            name: "#{i}Chelsea#{i}",
            color: "ShadeOfBlue"
            )
        end

        20.times do |i|
            Player.find_or_create_by(
                first_name: "Kepa",
                last_name: "Arrizabalaga#{i}",
                age: 23,
                team_id: RealTeam.all[i].id,
                position_id: Position.all[0].id
            )
        end

        60.times do |i|
            Player.find_or_create_by(
                first_name: "Antonio",
                last_name: "Rudiger#{i}",
                age: 25,
                team_id: RealTeam.all[i % (RealTeam.count)].id,
                position_id: Position.all[1].id
            )
        end

        80.times do |i|
            Player.find_or_create_by(
                first_name: "Alvin",
                last_name: "Bakayoko#{i}",
                age: 25,
                team_id: RealTeam.all[i % (RealTeam.count)].id,
                position_id: Position.all[2].id
            )
        end

        60.times do |i|
            Player.find_or_create_by(
                first_name: "Tammy",
                last_name: "Abraham#{i}",
                age: 21,
                team_id: RealTeam.all[i % (RealTeam.count)].id,
                position_id: Position.all[3].id
            )
        end

        wes = RealTeam.find_or_create_by(
            name: "Losers",
            color: "Red"
        )


        20.times do |i|
            Match.find_or_create_by(
                home_team_id: RealTeam.all.ids[i],
                away_team_id: wes.id,
                matchweek: i + 1,
                date:  "2019-06-29 20:42:07 -0400"
            )
        end

        20.times do |i| PlayerStat.find_or_create_by(
            player_id: Player.all.ids[i],
            stat_id: Stat.first.id,
            match_id: Match.all[i].id
        )
        end

        5.times do |i| League.find_or_create_by(
            name: "MyLeague#{i}",
            manager_id: User.all[i].id
        )
    end

        20.times do |i| FantasyTeam.find_or_create_by(
            name: "MyTeam#{i}",
            color: "Why is this a category?",
            league_id: League.all[i % 5].id
        )
    end

        20.times do |i| UserTeam.find_or_create_by(
            user_id: User.all[i].id,
            team_id: FantasyTeam.all[i].id
        )
    end

        20.times do |i| FantasyTeamPlayer.find_or_create_by(
            player_id: Player.all[i].id,
            user_team_id: UserTeam.all[i].id
        )
    end

    formations = ["343", "352", "433", "451", "442", "532"]
    for formation in formations
        Formation.find_or_create_by(
            name: formation,
            gks: 1,
            defs: formation[0],
            mids: formation[1],
            fwds: formation[2]
        )
    end

    20.times do |i| Lineup.find_or_create_by(
        formation_id: Formation.first.id,
        user_team_id: UserTeam.all[i].id,
        matchweek: 1
    )
    end

    teams = RealTeam.all
    i = 0
    while i < teams.size - 1
        players = teams[i].players
            for player in players
                LineupPlayer.find_or_create_by(
                    lineup_id: Lineup.all[i].id,
                    player_id: player.id,
                    position_id: player.position_id
                )
            end
            i += 1
        end







#We have 20 fake matches, each ending 1-0 to chelsea (home team), with bakayoko scoring the lone goal in each.
# Each team only has one player (one of the Bakayoko's)
# 21 real teams, 20 fantasy teams, each fantasy team has one player



    end
end
