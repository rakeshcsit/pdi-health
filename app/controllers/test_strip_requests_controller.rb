class TestStripRequestsController < ApplicationController
  before_action :set_test_strip_request, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @test_strip_requests = TestStripRequest.all
    respond_with(@test_strip_requests)
  end

  def show
    respond_with(@test_strip_request)
  end

  def new
    @test_strip_request = TestStripRequest.new

    @test_strip_requests = TestStripRequest.where(:patient_id => current_user.patient.id)

    respond_with(@test_strip_request)
  end

  def edit
  end

  def create
    if current_user.role == "patient"
      @test_strip_request = TestStripRequest.new(test_strip_request_params)
      @test_strip_request.patient_id = current_user.patient.id
      @test_strip_request.save
      location = new_test_strip_request_path
    else
      location = root_path
    end

    redirect_to location
  end

  def update
    @test_strip_request.update(test_strip_request_params)

    if current_user.role == "patient"
      location = new_test_strip_request_path
    else
      location = test_strip_requests_path
    end

    redirect_to location
  end

  def destroy
    @test_strip_request.destroy
    respond_with(@test_strip_request)
  end

  private
    def set_test_strip_request
      @test_strip_request = TestStripRequest.find(params[:id])
    end

    def test_strip_request_params
      params.require(:test_strip_request).permit(:how_many_left, :patient_notes, :dealt_with, :communicated_with)
    end
end
