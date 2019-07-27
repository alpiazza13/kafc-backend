Fabricator(:match) do
  home_team {Fabricate(:real_team)}
  away_team {Fabricate(:real_team)}
  matchweek { Faker::Number.between(from=1,to=38) }
  date      { Faker::Date }
end
