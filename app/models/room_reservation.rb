class RoomReservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates_with RoomReservationValidator
end
