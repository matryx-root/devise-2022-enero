class CreateTerrains < ActiveRecord::Migration[6.1]
  def change
    create_table :terrains do |t|
      t.string :title
      t.text :description
      t.integer :value

      t.timestamps
    end
  end
end
