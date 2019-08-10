namespace :kafc do
    desc 'destroys development data'
    task destroy_dev_data: :environment do

        User.destroy_all
        Team.destroy_all
        Player.destroy_all
        Stat.destroy_all
        Match.destroy_all
        Position.destroy_all
        PlayerStat.destroy_all
        UserTeam.destroy_all
        League.destroy_all
        FantasyTeamPlayer.destroy_all

    end
end
