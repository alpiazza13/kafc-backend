class CreateLineups < ActiveRecord::Migration[5.2]
  def change
    create_table :lineups do |t|
      t.integer :formation_id
      t.integer :user_team_id
      t.integer :matchweek

      t.timestamps
    end
  end
end
