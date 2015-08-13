require 'test_helper'

class AnimalSheltersControllerTest < ActionController::TestCase
  setup do
    @animal_shelter = animal_shelters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:animal_shelters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create animal_shelter" do
    assert_difference('AnimalShelter.count') do
      post :create, animal_shelter: { city: @animal_shelter.city, description: @animal_shelter.description, image_url: @animal_shelter.image_url, phone: @animal_shelter.phone, title: @animal_shelter.title, website: @animal_shelter.website }
    end

    assert_redirected_to animal_shelter_path(assigns(:animal_shelter))
  end

  test "should show animal_shelter" do
    get :show, id: @animal_shelter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @animal_shelter
    assert_response :success
  end

  test "should update animal_shelter" do
    patch :update, id: @animal_shelter, animal_shelter: { city: @animal_shelter.city, description: @animal_shelter.description, image_url: @animal_shelter.image_url, phone: @animal_shelter.phone, title: @animal_shelter.title, website: @animal_shelter.website }
    assert_redirected_to animal_shelter_path(assigns(:animal_shelter))
  end

  test "should destroy animal_shelter" do
    assert_difference('AnimalShelter.count', -1) do
      delete :destroy, id: @animal_shelter
    end

    assert_redirected_to animal_shelters_path
  end
end
