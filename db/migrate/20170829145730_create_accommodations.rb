class CreateAccommodations < ActiveRecord::Migration[5.1]
  def change
    create_table :accommodations do |t|
      t.string :name
      t.text :description
      t.string :address
      t.float :average_grade
      t.float :latitude
      t.float :longitude
      t.string :image_url
      t.boolean :approved
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
