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
    end
end
