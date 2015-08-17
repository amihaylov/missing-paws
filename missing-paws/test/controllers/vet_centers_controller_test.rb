require 'test_helper'

class VetCentersControllerTest < ActionController::TestCase
  setup do
    @vet_center = vet_centers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vet_centers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vet_center" do
    assert_difference('VetCenter.count') do
      post :create, vet_center: { city: @vet_center.city, description: @vet_center.description, image_url: @vet_center.image_url, phone: @vet_center.phone, title: @vet_center.title, website: @vet_center.website }
    end

    assert_redirected_to vet_center_path(assigns(:vet_center))
  end

  test "should show vet_center" do
    get :show, id: @vet_center
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vet_center
    assert_response :success
  end

  test "should update vet_center" do
    patch :update, id: @vet_center, vet_center: { city: @vet_center.city, description: @vet_center.description, image_url: @vet_center.image_url, phone: @vet_center.phone, title: @vet_center.title, website: @vet_center.website }
    assert_redirected_to vet_center_path(assigns(:vet_center))
  end

  test "should destroy vet_center" do
    assert_difference('VetCenter.count', -1) do
      delete :destroy, id: @vet_center
    end

    assert_redirected_to vet_centers_path
  end
end
