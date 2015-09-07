require 'test_helper'

class AdoptionsControllerTest < ActionController::TestCase
  setup do
    @adoption = adoptions(:one)
      @update = {
        title: 'Lorem Ipsum',
        description: 'Wibbles are fun!',
        image_url: 'lorem.jpg',
        phone: 123,
        city: 'Sofia',
        name: 'Toshko',
        email: 'admin@gmail.com'
      }

  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adoptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create adoption" do
    assert_difference('Adoption.count') do
      post :create, adoption: @update
    end

    assert_redirected_to adoption_path(assigns(:adoption))
  end

  test "should show adoption" do
    get :show, id: @adoption
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @adoption
    assert_response :success
  end

  test "should update adoption" do
    patch :update, id: @adoption, adoption: @update
  end

  test "should destroy adoption" do
    assert_difference('Adoption.count', -1) do
      delete :destroy, id: @adoption
    end

    assert_redirected_to adoptions_path
  end
end
