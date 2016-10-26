require 'test_helper'

class StudentSuccessManagersControllerTest < ActionController::TestCase
  setup do
    @student_success_manager = student_success_managers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_success_managers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_success_manager" do
    assert_difference('StudentSuccessManager.count') do
      post :create, student_success_manager: { ss: @student_success_manager.ss, ss_email: @student_success_manager.ss_email, university_id: @student_success_manager.university_id }
    end

    assert_redirected_to student_success_manager_path(assigns(:student_success_manager))
  end

  test "should show student_success_manager" do
    get :show, id: @student_success_manager
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_success_manager
    assert_response :success
  end

  test "should update student_success_manager" do
    patch :update, id: @student_success_manager, student_success_manager: { ss: @student_success_manager.ss, ss_email: @student_success_manager.ss_email, university_id: @student_success_manager.university_id }
    assert_redirected_to student_success_manager_path(assigns(:student_success_manager))
  end

  test "should destroy student_success_manager" do
    assert_difference('StudentSuccessManager.count', -1) do
      delete :destroy, id: @student_success_manager
    end

    assert_redirected_to student_success_managers_path
  end
end
