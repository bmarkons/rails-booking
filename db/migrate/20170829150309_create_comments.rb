class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.float :average_grade
      t.text :text
      t.references :user, foreign_key: true
      t.references :accommodation, foreign_key: true

      t.timestamps
    end
  end
end
