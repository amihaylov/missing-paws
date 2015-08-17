require 'test_helper'

class PetShopsControllerTest < ActionController::TestCase
  setup do
    @pet_shop = pet_shops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pet_shops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pet_shop" do
    assert_difference('PetShop.count') do
      post :create, pet_shop: { city: @pet_shop.city, description: @pet_shop.description, image_url: @pet_shop.image_url, phone: @pet_shop.phone, title: @pet_shop.title, website: @pet_shop.website }
    end

    assert_redirected_to pet_shop_path(assigns(:pet_shop))
  end

  test "should show pet_shop" do
    get :show, id: @pet_shop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pet_shop
    assert_response :success
  end

  test "should update pet_shop" do
    patch :update, id: @pet_shop, pet_shop: { city: @pet_shop.city, description: @pet_shop.description, image_url: @pet_shop.image_url, phone: @pet_shop.phone, title: @pet_shop.title, website: @pet_shop.website }
    assert_redirected_to pet_shop_path(assigns(:pet_shop))
  end

  test "should destroy pet_shop" do
    assert_difference('PetShop.count', -1) do
      delete :destroy, id: @pet_shop
    end

    assert_redirected_to pet_shops_path
  end
end
