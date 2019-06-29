
Fabricator(:position) do
    position_list = ["Goal Keeper","Defender","Forward","Midfielder"]
    stat_name { position_list.sample }
  end