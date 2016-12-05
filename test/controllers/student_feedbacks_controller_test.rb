require 'test_helper'

class StudentFeedbacksControllerTest < ActionController::TestCase
  setup do
    @student_feedback = student_feedbacks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_feedbacks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_feedback" do
    assert_difference('StudentFeedback.count') do
      post :create, student_feedback: { acad_supp: @student_feedback.acad_supp, add_notes: @student_feedback.add_notes, class_code: @student_feedback.class_code, hours_outside: @student_feedback.hours_outside, how_class_week: @student_feedback.how_class_week, inst_clarity: @student_feedback.inst_clarity, inst_engag: @student_feedback.inst_engag, inst_know: @student_feedback.inst_know, inst_notes: @student_feedback.inst_notes, mastery: @student_feedback.mastery, new_learn: @student_feedback.new_learn, pace: @student_feedback.pace, pace_notes: @student_feedback.pace_notes, spend_time_on: @student_feedback.spend_time_on, student_name: @student_feedback.student_name, support_notes: @student_feedback.support_notes, week: @student_feedback.week }
    end

    assert_redirected_to student_feedback_path(assigns(:student_feedback))
  end

  test "should show student_feedback" do
    get :show, id: @student_feedback
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_feedback
    assert_response :success
  end

  test "should update student_feedback" do
    patch :update, id: @student_feedback, student_feedback: { acad_supp: @student_feedback.acad_supp, add_notes: @student_feedback.add_notes, class_code: @student_feedback.class_code, hours_outside: @student_feedback.hours_outside, how_class_week: @student_feedback.how_class_week, inst_clarity: @student_feedback.inst_clarity, inst_engag: @student_feedback.inst_engag, inst_know: @student_feedback.inst_know, inst_notes: @student_feedback.inst_notes, mastery: @student_feedback.mastery, new_learn: @student_feedback.new_learn, pace: @student_feedback.pace, pace_notes: @student_feedback.pace_notes, spend_time_on: @student_feedback.spend_time_on, student_name: @student_feedback.student_name, support_notes: @student_feedback.support_notes, week: @student_feedback.week }
    assert_redirected_to student_feedback_path(assigns(:student_feedback))
  end

  test "should destroy student_feedback" do
    assert_difference('StudentFeedback.count', -1) do
      delete :destroy, id: @student_feedback
    end

    assert_redirected_to student_feedbacks_path
  end
end
