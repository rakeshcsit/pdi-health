require 'test_helper'

class TierUpdatesControllerTest < ActionController::TestCase
  setup do
    @tier_update = tier_updates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tier_updates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tier_update" do
    assert_difference('TierUpdate.count') do
      post :create, tier_update: { instructor_id: @tier_update.instructor_id, new_tier: @tier_update.new_tier, notes: @tier_update.notes, old_tier: @tier_update.old_tier }
    end

    assert_redirected_to tier_update_path(assigns(:tier_update))
  end

  test "should show tier_update" do
    get :show, id: @tier_update
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tier_update
    assert_response :success
  end

  test "should update tier_update" do
    patch :update, id: @tier_update, tier_update: { instructor_id: @tier_update.instructor_id, new_tier: @tier_update.new_tier, notes: @tier_update.notes, old_tier: @tier_update.old_tier }
    assert_redirected_to tier_update_path(assigns(:tier_update))
  end

  test "should destroy tier_update" do
    assert_difference('TierUpdate.count', -1) do
      delete :destroy, id: @tier_update
    end

    assert_redirected_to tier_updates_path
  end
end
