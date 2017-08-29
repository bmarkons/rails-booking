class AddUserToRoomReservation < ActiveRecord::Migration[5.1]
  def change
    add_reference :room_reservations, :user, foreign_key: true
  end
end
