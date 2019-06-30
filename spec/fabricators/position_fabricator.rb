
Fabricator(:position) do
    position_list = ["Goal Keeper","Defender","Forward","Midfielder"]
    name { position_list.sample }
  end