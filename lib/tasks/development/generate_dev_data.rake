namespace :kafc do
    desc 'generates development data'
    task generate_dev_data: :environment do
        20.times do |i|
            User.find_or_create_by(
                email: "test-email#{i}@test.com",
                first_name: "Kurt",
                last_name: "Zouma#{i}000"
            )
        end
        20.times do |i|
            Player.find_or_create_by(
                first_name: "Alvin",
                last_name: "Bakayoko#{i}000",
                age: i+20
            )
        end
        20.times do |i|
            Team.find_or_create_by(
            name: "#{i}Chelsea#{i}",
            color: "ShadeOfBlue"
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

    end
end
