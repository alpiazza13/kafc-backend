Fabricator(:team) do
  name { Faker::Team.name.sub("'", '') }
  color { Faker::Color.color_name.sub("'", '') }
end

Fabricator(:real_team, from: :team) do
  type 'RealTeam'
end

Fabricator(:fantasy_team, from: :team) do
  type 'FantasyTeam'
  league_id 1
end
