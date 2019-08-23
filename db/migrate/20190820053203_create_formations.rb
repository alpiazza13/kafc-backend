class CreateFormations < ActiveRecord::Migration[5.2]
  def change
    create_table :formations do |t|
      t.string :name
      t.integer :gks
      t.integer :defs
      t.integer :mids
      t.integer :fwds

      t.timestamps
    end
  end
end
