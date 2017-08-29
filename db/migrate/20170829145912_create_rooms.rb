class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :number
      t.integer :beds
      t.text :description
      t.float :price
      t.references :accommodation, foreign_key: true

      t.timestamps
    end
  end
end
