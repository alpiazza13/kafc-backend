Fabricator(:player_stat) do
  player_id { |attrs| attrs[:player].id }
  stat_id   { |attrs| attrs[:stat].id }
  match_id  { |attrs| attrs[:match].id }
end