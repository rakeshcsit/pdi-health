class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @doctors = Doctor.all
    respond_with(@doctors)
  end

  def show
    respond_with(@doctor)
  end

  def new
    @doctor = Doctor.new
    respond_with(@doctor)
  end

  def edit
  end

  def create
    @doctor = Doctor.new(doctor_params)
    @doctor.save
    respond_with(@doctor)
  end

  def update
    @doctor.update(doctor_params)
    respond_with(@doctor)
  end

  def destroy
    @doctor.destroy
    respond_with(@doctor)
  end

  private
    def set_patients
      # get all the patients that don't have doctors assigned to them
      # so find all patients that are not in the doctors_patients table and find all the patients in the doctors_patients table that are set to false
      @patients = Patient
      .joins('LEFT JOIN doctors_patients dp ON dp.patient_id = patients.id')
      .where(dp.active != true)

      # Topic.where( 'forum_id not in (?)', (@forums.empty? ? '' : @forums.map(&:id)) ).all

      # Article.where.not(id: ['Rails 3', 'Rails 5'])

      # @discuss_topics = DiscussTopic.joins("LEFT JOIN discuss_categories dc 
      # ON dc.id = discuss_topics.discuss_category_id").where("dc.bugs = false AND dc.feature_requests = false").order('id desc').select("discuss_topics.*")
    end

    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params
      params.require(:doctor).permit(:user_id, :full_name, :email, :phone_number, :fax_number, :address, :state, :zipcode, :hours, :patient_ids => [])
    end
end
