require 'test_helper'

class RoomReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room_reservation = room_reservations(:one)
  end

  test "should get index" do
    get room_reservations_url, as: :json
    assert_response :success
  end

  test "should create room_reservation" do
    assert_difference('RoomReservation.count') do
      post room_reservations_url, params: { room_reservation: { end: @room_reservation.end, room_id: @room_reservation.room_id, start: @room_reservation.start } }, as: :json
    end

    assert_response 201
  end

  test "should show room_reservation" do
    get room_reservation_url(@room_reservation), as: :json
    assert_response :success
  end

  test "should update room_reservation" do
    patch room_reservation_url(@room_reservation), params: { room_reservation: { end: @room_reservation.end, room_id: @room_reservation.room_id, start: @room_reservation.start } }, as: :json
    assert_response 200
  end

  test "should destroy room_reservation" do
    assert_difference('RoomReservation.count', -1) do
      delete room_reservation_url(@room_reservation), as: :json
    end

    assert_response 204
  end
end
