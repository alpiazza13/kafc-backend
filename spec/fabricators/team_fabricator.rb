Fabricator(:team) do
  name { Faker::Team.name.sub("'", '') }
  color { Faker::Color.color_name.sub("'", '') }
end
