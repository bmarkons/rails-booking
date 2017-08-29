require 'test_helper'

class AccommodationTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accommodation_type = accommodation_types(:one)
  end

  test "should get index" do
    get accommodation_types_url, as: :json
    assert_response :success
  end

  test "should create accommodation_type" do
    assert_difference('AccommodationType.count') do
      post accommodation_types_url, params: { accommodation_type: { name: @accommodation_type.name } }, as: :json
    end

    assert_response 201
  end

  test "should show accommodation_type" do
    get accommodation_type_url(@accommodation_type), as: :json
    assert_response :success
  end

  test "should update accommodation_type" do
    patch accommodation_type_url(@accommodation_type), params: { accommodation_type: { name: @accommodation_type.name } }, as: :json
    assert_response 200
  end

  test "should destroy accommodation_type" do
    assert_difference('AccommodationType.count', -1) do
      delete accommodation_type_url(@accommodation_type), as: :json
    end

    assert_response 204
  end
end
