require 'test_helper'

class InrsControllerTest < ActionController::TestCase
  setup do
    @inr = inrs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inrs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inr" do
    assert_difference('Inr.count') do
      post :create, inr: { note: @inr.note, references: @inr.references, value: @inr.value, wdate: @inr.wdate }
    end

    assert_redirected_to inr_path(assigns(:inr))
  end

  test "should show inr" do
    get :show, id: @inr
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inr
    assert_response :success
  end

  test "should update inr" do
    patch :update, id: @inr, inr: { note: @inr.note, references: @inr.references, value: @inr.value, wdate: @inr.wdate }
    assert_redirected_to inr_path(assigns(:inr))
  end

  test "should destroy inr" do
    assert_difference('Inr.count', -1) do
      delete :destroy, id: @inr
    end

    assert_redirected_to inrs_path
  end
end
