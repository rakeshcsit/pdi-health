require 'test_helper'

class TestStripRequestsControllerTest < ActionController::TestCase
  setup do
    @test_strip_request = test_strip_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_strip_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_strip_request" do
    assert_difference('TestStripRequest.count') do
      post :create, test_strip_request: { how_many_left: @test_strip_request.how_many_left, patient_id: @test_strip_request.patient_id, patient_notes: @test_strip_request.patient_notes }
    end

    assert_redirected_to test_strip_request_path(assigns(:test_strip_request))
  end

  test "should show test_strip_request" do
    get :show, id: @test_strip_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_strip_request
    assert_response :success
  end

  test "should update test_strip_request" do
    patch :update, id: @test_strip_request, test_strip_request: { how_many_left: @test_strip_request.how_many_left, patient_id: @test_strip_request.patient_id, patient_notes: @test_strip_request.patient_notes }
    assert_redirected_to test_strip_request_path(assigns(:test_strip_request))
  end

  test "should destroy test_strip_request" do
    assert_difference('TestStripRequest.count', -1) do
      delete :destroy, id: @test_strip_request
    end

    assert_redirected_to test_strip_requests_path
  end
end
