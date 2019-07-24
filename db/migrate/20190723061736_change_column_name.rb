class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
      rename_column :fantasy_team_players, :team_id, :user_team_id
  end
end
