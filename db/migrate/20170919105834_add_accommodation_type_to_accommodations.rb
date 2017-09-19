class AddAccommodationTypeToAccommodations < ActiveRecord::Migration[5.1]
  def change
    add_reference :accommodations, :accommodation_type, foreign_key: true
    add_reference :accommodations, :place, foreign_key: true
  end
end
