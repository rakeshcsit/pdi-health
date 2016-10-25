require 'test_helper'

class RdsControllerTest < ActionController::TestCase
  setup do
    @rd = rds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rd" do
    assert_difference('Rd.count') do
      post :create, rd: { rd: @rd.rd, rd_email: @rd.rd_email }
    end

    assert_redirected_to rd_path(assigns(:rd))
  end

  test "should show rd" do
    get :show, id: @rd
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rd
    assert_response :success
  end

  test "should update rd" do
    patch :update, id: @rd, rd: { rd: @rd.rd, rd_email: @rd.rd_email }
    assert_redirected_to rd_path(assigns(:rd))
  end

  test "should destroy rd" do
    assert_difference('Rd.count', -1) do
      delete :destroy, id: @rd
    end

    assert_redirected_to rds_path
  end
end
