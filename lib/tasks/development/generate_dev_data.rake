namespace :kafc do
    desc 'generates development data'
    task generate_dev_data: :environment do

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

        wes = RealTeam.find_or_create_by(
            name: "Losers",
            color: "Red"
        )

        pos1 = Position.find_or_create_by(name: "GK")
        pos2 = Position.find_or_create_by(name: "DEF")
        pos3 = Position.find_or_create_by(name: "MID")
        pos4 = Position.find_or_create_by(name: "FWD")
        pos5 = Position.find_or_create_by(name: "DEF/MID")
        pos6 = Position.find_or_create_by(name: "MID/FWD")

        20.times do |i|
            Player.find_or_create_by(
                first_name: "Alvin",
                last_name: "Bakayoko#{i}000",
                age: i+20,
                team_id: Team.all[i].id,
                position_id: Position.all[2].id
            )
        end

        stat = Stat.find_or_create_by(stat_name: 'Goal')
        stat.update_attribute(:points, 5)

        stat1 = Stat.find_or_create_by(stat_name: 'Assist')
        stat1.update_attribute(:points, 2)

        stat2 = Stat.find_or_create_by(stat_name: 'Red Card')
        stat2.update_attribute(:points, 100)

        stat3 = Stat.find_or_create_by(stat_name: 'Yellow Card')
        stat3.update_attribute(:points, -5)

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

        20.times do |i| FantasyTeam.find_or_create_by(
            name: "MyTeam#{i}",
            color: "Why is this a category?"
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

#We have 20 fake matches, each ending 1-0 to chelsea (home team), with bakayoko scoring the lone goal in each.
# Each team only has one player (one of the Bakayoko's)
# 21 real teams, 20 fantasy teams, each fantasy team has one player



    end
end
