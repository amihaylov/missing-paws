require 'test_helper'

class LostAnimalsControllerTest < ActionController::TestCase
  setup do
    @lost_animal = lost_animals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lost_animals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lost_animal" do
    assert_difference('LostAnimal.count') do
      post :create, lost_animal: { city: @lost_animal.city, description: @lost_animal.description, email: @lost_animal.email, image_file_name: @lost_animal.image_file_name, name: @lost_animal.name, phone: @lost_animal.phone, title: @lost_animal.title }
    end

    assert_redirected_to lost_animal_path(assigns(:lost_animal))
  end

  test "should show lost_animal" do
    get :show, id: @lost_animal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lost_animal
    assert_response :success
  end

  test "should update lost_animal" do
    patch :update, id: @lost_animal, lost_animal: { city: @lost_animal.city, description: @lost_animal.description, email: @lost_animal.email, image_file_name: @lost_animal.image_file_name, name: @lost_animal.name, phone: @lost_animal.phone, title: @lost_animal.title }
    assert_redirected_to lost_animal_path(assigns(:lost_animal))
  end

  test "should destroy lost_animal" do
    assert_difference('LostAnimal.count', -1) do
      delete :destroy, id: @lost_animal
    end

    assert_redirected_to lost_animals_path
  end
end
