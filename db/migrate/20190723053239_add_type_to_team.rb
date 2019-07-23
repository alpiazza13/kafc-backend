class AddTypeToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :type, :string
  end
end
