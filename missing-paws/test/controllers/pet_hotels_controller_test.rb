require 'test_helper'

class PetHotelsControllerTest < ActionController::TestCase
  setup do
    @pet_hotel = pet_hotels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pet_hotels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pet_hotel" do
    assert_difference('PetHotel.count') do
      post :create, pet_hotel: { city: @pet_hotel.city, description: @pet_hotel.description, image_url: @pet_hotel.image_url, phone: @pet_hotel.phone, title: @pet_hotel.title, website: @pet_hotel.website }
    end

    assert_redirected_to pet_hotel_path(assigns(:pet_hotel))
  end

  test "should show pet_hotel" do
    get :show, id: @pet_hotel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pet_hotel
    assert_response :success
  end

  test "should update pet_hotel" do
    patch :update, id: @pet_hotel, pet_hotel: { city: @pet_hotel.city, description: @pet_hotel.description, image_url: @pet_hotel.image_url, phone: @pet_hotel.phone, title: @pet_hotel.title, website: @pet_hotel.website }
    assert_redirected_to pet_hotel_path(assigns(:pet_hotel))
  end

  test "should destroy pet_hotel" do
    assert_difference('PetHotel.count', -1) do
      delete :destroy, id: @pet_hotel
    end

    assert_redirected_to pet_hotels_path
  end
end
