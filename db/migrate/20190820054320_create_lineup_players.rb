class CreateLineupPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :lineup_players do |t|
      t.integer :lineup_id
      t.integer :player_id
      t.integer :position_id

      t.timestamps
    end
  end
end
