class CreateRoomReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :room_reservations do |t|
      t.timestamp :start
      t.timestamp :end
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
