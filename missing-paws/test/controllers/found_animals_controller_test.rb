require 'test_helper'

class FoundAnimalsControllerTest < ActionController::TestCase
  setup do
    @found_animal = found_animals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:found_animals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create found_animal" do
    assert_difference('FoundAnimal.count') do
      post :create, found_animal: { city: @found_animal.city, description: @found_animal.description, email: @found_animal.email, image_file_name: @found_animal.image_file_name, name: @found_animal.name, phone: @found_animal.phone, title: @found_animal.title }
    end

    assert_redirected_to found_animal_path(assigns(:found_animal))
  end

  test "should show found_animal" do
    get :show, id: @found_animal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @found_animal
    assert_response :success
  end

  test "should update found_animal" do
    patch :update, id: @found_animal, found_animal: { city: @found_animal.city, description: @found_animal.description, email: @found_animal.email, image_file_name: @found_animal.image_file_name, name: @found_animal.name, phone: @found_animal.phone, title: @found_animal.title }
    assert_redirected_to found_animal_path(assigns(:found_animal))
  end

  test "should destroy found_animal" do
    assert_difference('FoundAnimal.count', -1) do
      delete :destroy, id: @found_animal
    end

    assert_redirected_to found_animals_path
  end
end
