require 'test_helper'

class PetAcademiesControllerTest < ActionController::TestCase
  setup do
    @pet_academy = pet_academies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pet_academies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pet_academy" do
    assert_difference('PetAcademy.count') do
      post :create, pet_academy: { city: @pet_academy.city, description: @pet_academy.description, image_url: @pet_academy.image_url, phone: @pet_academy.phone, title: @pet_academy.title, website: @pet_academy.website }
    end

    assert_redirected_to pet_academy_path(assigns(:pet_academy))
  end

  test "should show pet_academy" do
    get :show, id: @pet_academy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pet_academy
    assert_response :success
  end

  test "should update pet_academy" do
    patch :update, id: @pet_academy, pet_academy: { city: @pet_academy.city, description: @pet_academy.description, image_url: @pet_academy.image_url, phone: @pet_academy.phone, title: @pet_academy.title, website: @pet_academy.website }
    assert_redirected_to pet_academy_path(assigns(:pet_academy))
  end

  test "should destroy pet_academy" do
    assert_difference('PetAcademy.count', -1) do
      delete :destroy, id: @pet_academy
    end

    assert_redirected_to pet_academies_path
  end
end
