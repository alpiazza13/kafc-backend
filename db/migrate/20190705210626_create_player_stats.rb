class CreatePlayerStats < ActiveRecord::Migration[5.2]
  def change
    create_table :player_stats do |t|
      t.integer :player_id
      t.integer :stat_id
      t.integer :match_id

      t.timestamps
    end
  end
end
