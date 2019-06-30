Fabricator(:match) do
  home_team {Fabricate(:team)}
  away_team {Fabricate(:team)}
  matchweek { Faker::Number.between(from=1,to=38) }
  date      { Faker::Date }
end
