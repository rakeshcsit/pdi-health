class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
  before_action :set_patients, only: [:new, :edit, :create, :update, :destroy]

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def edit
  end

  def create
    @doctor = Doctor.new(doctor_params)

    pass = @doctor.email.split("@")[0].downcase + "123456"

    u = User.new({:email => @doctor.email, :password => pass, :password => pass, :reset_password_token => nil, :reset_password_sent_at => nil, :remember_created_at => nil, :sign_in_count => 0, :current_sign_in_at => nil, :last_sign_in_at => nil, :current_sign_in_ip => nil, :last_sign_in_ip => nil, :created_at => nil, :updated_at => nil, :role => 0})

    if u.save
      @doctor.user_id = u.id

      if @doctor.save
        respond_to do |format|
          format.html { redirect_to doctors_path }
          format.json { render :show, status: :created, location: @doctor }
        end
      else
        respond_to do |format|
          format.html { render :new }
          format.json { render json: @doctor.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: 'Doctor was updated.' }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_patients
      # this is an example of a patient that I don't want to sign to a doctor
        #   doctor_id patient_id active

        #   1          1          false
        #   2          1          false
        #   3          1          true

      # need to find all patients available for an active doctor
        # find all the patients that have never been assigned a doctor
          # UNION
        # find all the patients that have inactive doctors and at the same time no active doctors

        patient_sql = "SELECT *
        FROM patients
        WHERE id NOT IN (SELECT patient_id FROM manegizations)
        UNION
        (SELECT * 
        FROM patients
        WHERE id IN (SELECT patient_id FROM manegizations WHERE active = false AND
        patient_id NOT IN (SELECT patient_id FROM manegizations WHERE active = true)))"
      @patients = Patient.find_by_sql(patient_sql)
    end

    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params
      params.require(:doctor).permit(:user_id, :full_name, :email, :phone_number, :fax_number, :address, :state, :zipcode, :hours, :patient_ids => [])
    end
end
