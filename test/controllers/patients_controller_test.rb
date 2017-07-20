require 'test_helper'

class PatientsControllerTest < ActionController::TestCase
  setup do
    @patient = patients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient" do
    assert_difference('Patient.count') do
      post :create, patient: { address: @patient.address, communication_preferred: @patient.communication_preferred, email: @patient.email, first_name: @patient.first_name, insurance_verification: @patient.insurance_verification, last_name: @patient.last_name, middle_initial: @patient.middle_initial, phone_number: @patient.phone_number, prescription_acquired: @patient.prescription_acquired, qualified: @patient.qualified, state: @patient.state, user_id: @patient.user_id, zipcode: @patient.zipcode }
    end

    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should show patient" do
    get :show, id: @patient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patient
    assert_response :success
  end

  test "should update patient" do
    patch :update, id: @patient, patient: { address: @patient.address, communication_preferred: @patient.communication_preferred, email: @patient.email, first_name: @patient.first_name, insurance_verification: @patient.insurance_verification, last_name: @patient.last_name, middle_initial: @patient.middle_initial, phone_number: @patient.phone_number, prescription_acquired: @patient.prescription_acquired, qualified: @patient.qualified, state: @patient.state, user_id: @patient.user_id, zipcode: @patient.zipcode }
    assert_redirected_to patient_path(assigns(:patient))
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete :destroy, id: @patient
    end

    assert_redirected_to patients_path
  end
end
