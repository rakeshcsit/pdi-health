class StaffsController < ApplicationController
  before_action :set_staff, only: [:show, :edit, :update, :destroy]

  def index
    @staffs = Staff.all
  end

  def show
  end

  def new
    @staff = Staff.new
  end

  def edit
  end

  def create
    @staff = Staff.new(staff_params)
    
    ###
      pass = @staff.email.split("@")[0].downcase + "123456"

      u = User.new({:email => @staff.email, :password => pass, :password => pass, :reset_password_token => nil, :reset_password_sent_at => nil, :remember_created_at => nil, :sign_in_count => 0, :current_sign_in_at => nil, :last_sign_in_at => nil, :current_sign_in_ip => nil, :last_sign_in_ip => nil, :created_at => nil, :updated_at => nil, :role => 3})

      if u.save
        @staff.user_id = u.id

        if @staff.save
          respond_to do |format|
            format.html { redirect_to staffs_path }
            format.json { render :show, status: :created, location: @staff }
          end
        else
          respond_to do |format|
            format.html { render :new }
            format.json { render json: @staff.errors, status: :unprocessable_entity }
          end
        end
      else
        # ending up here
        #binding.pry
      end
    ###
  end

  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to @staff, notice: 'Staff was updated.' }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_staff
      @staff = Staff.find(params[:id])
    end

    def staff_params
      params.require(:staff).permit(:user_id, :full_name, :email)
    end
end
