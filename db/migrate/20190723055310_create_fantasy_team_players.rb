class CreateFantasyTeamPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :fantasy_team_players do |t|
      t.integer :player_id
      t.integer :team_id

      t.timestamps
    end
  end
end
