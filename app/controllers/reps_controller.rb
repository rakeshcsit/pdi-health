class RepsController < ApplicationController
  before_action :set_rep, only: [:show, :edit, :update, :destroy]
  before_action :set_patients, only: [:new, :edit, :update, :destroy]

  def index
    @reps = Rep.all
  end

  def show
  end

  def new
    @rep = Rep.new
  end

  def edit
    @timezone = @rep.user.time_zone
  end

  def create
    @rep = Rep.new(rep_params)
    
    ###
      pass = @rep.email.split("@")[0].downcase + "123456"

      u = User.new({:email => @rep.email, :password => pass, :password => pass, :reset_password_token => nil, :reset_password_sent_at => nil, :remember_created_at => nil, :sign_in_count => 0, :current_sign_in_at => nil, :last_sign_in_at => nil, :current_sign_in_ip => nil, :last_sign_in_ip => nil, :created_at => nil, :updated_at => nil, :role => 2, :time_zone => params["user"]["time_zone"]})

      if u.save
        @rep.user_id = u.id

        if @rep.save
          respond_to do |format|
            format.html { redirect_to reps_path }
            format.json { render :show, status: :created, location: @rep }
          end
        else
          respond_to do |format|
            format.html { render :new }
            format.json { render json: @rep.errors, status: :unprocessable_entity }
          end
        end
      else
        # ending up here
        #binding.pry
      end
    ###
  end

  def update
    user = @rep.user

    user.update({:email => @rep.email, :time_zone => params["user"]["time_zone"]})

    respond_to do |format|
      if @rep.update(rep_params)
        format.html { redirect_to @rep, notice: 'Field Rep was updated. Password remains the same.' }
        format.json { render :show, status: :ok, location: @rep }
      else
        format.html { render :edit }
        format.json { render json: @rep.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rep.destroy
    respond_to do |format|
      format.html { redirect_to reps_url, notice: 'Field Rep was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_patients
      @patients = Patient.all
    end
    
    def set_rep
      @rep = Rep.find(params[:id])
    end

    def rep_params
      params.require(:rep).permit(:user_id, :full_name, :email, :phone_number, :patient_ids => [])
    end
end
