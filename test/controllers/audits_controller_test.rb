require 'test_helper'

class AuditsControllerTest < ActionController::TestCase
  setup do
    @audit = audits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:audits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create audit" do
    assert_difference('Audit.count') do
      post :create, audit: { action_flag: @audit.action_flag, anti_jargon_notes: @audit.anti_jargon_notes, anti_jargon_num: @audit.anti_jargon_num, audio_qual_num: @audit.audio_qual_num, big_flag: @audit.big_flag, code_is_no_big: @audit.code_is_no_big, directed_quest_num: @audit.directed_quest_num, discuss_num: @audit.discuss_num, engage_notes: @audit.engage_notes, engage_num: @audit.engage_num, fame: @audit.fame, fame_notes: @audit.fame_notes, fifteen_noeng: @audit.fifteen_noeng, instructor_id: @audit.instructor_id, lesson_plan_id: @audit.lesson_plan_id, mean_quest_num: @audit.mean_quest_num, mov_aw_noi_num: @audit.mov_aw_noi_num, nervous: @audit.nervous, notes: @audit.notes, objs: @audit.objs, overall_factors: @audit.overall_factors, overall_num: @audit.overall_num, percent_hp_lp: @audit.percent_hp_lp, percent_lp: @audit.percent_lp, tangent_notes: @audit.tangent_notes, tangent_num: @audit.tangent_num, video_url: @audit.video_url, vocal_enc_num: @audit.vocal_enc_num }
    end

    assert_redirected_to audit_path(assigns(:audit))
  end

  test "should show audit" do
    get :show, id: @audit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @audit
    assert_response :success
  end

  test "should update audit" do
    patch :update, id: @audit, audit: { action_flag: @audit.action_flag, anti_jargon_notes: @audit.anti_jargon_notes, anti_jargon_num: @audit.anti_jargon_num, audio_qual_num: @audit.audio_qual_num, big_flag: @audit.big_flag, code_is_no_big: @audit.code_is_no_big, directed_quest_num: @audit.directed_quest_num, discuss_num: @audit.discuss_num, engage_notes: @audit.engage_notes, engage_num: @audit.engage_num, fame: @audit.fame, fame_notes: @audit.fame_notes, fifteen_noeng: @audit.fifteen_noeng, instructor_id: @audit.instructor_id, lesson_plan_id: @audit.lesson_plan_id, mean_quest_num: @audit.mean_quest_num, mov_aw_noi_num: @audit.mov_aw_noi_num, nervous: @audit.nervous, notes: @audit.notes, objs: @audit.objs, overall_factors: @audit.overall_factors, overall_num: @audit.overall_num, percent_hp_lp: @audit.percent_hp_lp, percent_lp: @audit.percent_lp, tangent_notes: @audit.tangent_notes, tangent_num: @audit.tangent_num, video_url: @audit.video_url, vocal_enc_num: @audit.vocal_enc_num }
    assert_redirected_to audit_path(assigns(:audit))
  end

  test "should destroy audit" do
    assert_difference('Audit.count', -1) do
      delete :destroy, id: @audit
    end

    assert_redirected_to audits_path
  end
end
