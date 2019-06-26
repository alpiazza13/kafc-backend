Fabricator(:stat) do
  # stat_name "MyString"
  # points    1
  list_stats = ["Goal", "Assist", "Tackle", "Dribble", "Save", "Yellow Card", "Red Card", "Interception"]
  stat_name { list_stats[ Faker::Number.between(from = 0,to = list_stats.length-1) ] }
  points {Faker::Number.between(from=1,to=10)} 
end
