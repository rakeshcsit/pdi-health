class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :set_doctors, only: [:new, :edit, :update, :destroy]

  def index
    @patients = Patient.all
  end

  def show   
    @patient_full_name = "#{@patient.first_name} #{@patient.middle_initial} #{@patient.last_name}"
     
    #create chart
      @inrs = @patient.user.inrs
        inr_list = @inrs.pluck(:value)
        inr_date_list = @inrs.pluck(:wdate)

        chart_data = inr_date_list.each_with_index.map { |n, i| [n, inr_list[i]] }

        @chart_data_hash = Hash[*chart_data.flatten]
  end

  def new
    @patient = Patient.new
  end

  def edit
    @timezone = @patient.user.time_zone
  end

  def create
    @patient = Patient.new(patient_params)

    ###
      pass = @patient.email.split("@")[0].downcase + "123456"

      u = User.new({:email => @patient.email, :password => pass, :password => pass, :reset_password_token => nil, :reset_password_sent_at => nil, :remember_created_at => nil, :sign_in_count => 0, :current_sign_in_at => nil, :last_sign_in_at => nil, :current_sign_in_ip => nil, :last_sign_in_ip => nil, :created_at => nil, :updated_at => nil, :role => 0, :time_zone => params["user"]["time_zone"]})

      if u.save
        @patient.user_id = u.id

        if @patient.save
          respond_to do |format|
            format.html { redirect_to patients_path }
            format.json { render :show, status: :created, location: @patient }
          end
        else
          respond_to do |format|
            format.html { render :new }
            format.json { render json: @patient.errors, status: :unprocessable_entity }
          end
        end
      #else
        # ending up here
        #binding.pry
      end
    ###
  end

  def update
    user = @patient.user

    user.update({:email => @patient.email, :time_zone => params["user"]["time_zone"]})

    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was updated. Password remains the same.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_doctors
      @doctors = Doctor.all
    end

    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:user_id, :first_name, :middle_initial, :last_name, :email, :qualified, :communication_preferred, :insurance_verification, :prescription_acquired, :phone_number, :address, :state, :zipcode, :doctor_ids => [])
    end
end
