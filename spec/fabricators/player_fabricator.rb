Fabricator(:player) do
    first_name { Faker::Name.first_name.sub("'", '') }
    last_name { Faker::Name.last_name.sub("'", '') }
    age { Faker::Number.between(from=15,to=50) }
    team { Fabricate(:team) }
  end
