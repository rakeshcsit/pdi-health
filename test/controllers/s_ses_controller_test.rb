require 'test_helper'

class SSesControllerTest < ActionController::TestCase
  setup do
    @ss = sses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ss" do
    assert_difference('Ss.count') do
      post :create, ss: { ss: @ss.ss, ss_email: @ss.ss_email, university_id: @ss.university_id }
    end

    assert_redirected_to student_success_manager_path(assigns(:ss))
  end

  test "should show ss" do
    get :show, id: @ss
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ss
    assert_response :success
  end

  test "should update ss" do
    patch :update, id: @ss, ss: { ss: @ss.ss, ss_email: @ss.ss_email, university_id: @ss.university_id }
    assert_redirected_to student_success_manager_path(assigns(:ss))
  end

  test "should destroy ss" do
    assert_difference('Ss.count', -1) do
      delete :destroy, id: @ss
    end

    assert_redirected_to sses_path
  end
end
