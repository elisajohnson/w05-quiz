require 'test_helper'

class PastriesControllerTest < ActionController::TestCase
  setup do
    @pastry = pastries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pastries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pastry" do
    assert_difference('Pastry.count') do
      post :create, pastry: { name: @pastry.name, price: @pastry.price, quantity: @pastry.quantity }
    end

    assert_redirected_to pastry_path(assigns(:pastry))
  end

  test "should show pastry" do
    get :show, id: @pastry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pastry
    assert_response :success
  end

  test "should update pastry" do
    patch :update, id: @pastry, pastry: { name: @pastry.name, price: @pastry.price, quantity: @pastry.quantity }
    assert_redirected_to pastry_path(assigns(:pastry))
  end

  test "should destroy pastry" do
    assert_difference('Pastry.count', -1) do
      delete :destroy, id: @pastry
    end

    assert_redirected_to pastries_path
  end
end
