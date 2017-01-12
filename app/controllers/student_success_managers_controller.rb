class StudentSuccessManagersController < ApplicationController
  before_action :set_student_success_manager, only: [:show, :edit, :update, :destroy]
  before_action :set_universities, only: [:new, :edit, :create]
  before_filter :authenticate_user!
  before_action :check_if_admin, only: [:new, :edit, :create, :update, :destroy]

  # GET /student_success_managers
  # GET /student_success_managers.json
  def index
    @student_success_managers = StudentSuccessManager.all
  end

  # GET /student_success_managers/1
  # GET /student_success_managers/1.json
  def show
  end

  # GET /student_success_managers/new
  def new
    @student_success_manager = StudentSuccessManager.new
  end

  # GET /student_success_managers/1/edit
  def edit
  end

  # POST /student_success_managers
  # POST /student_success_managers.json
  def create
    @student_success_manager = StudentSuccessManager.new(student_success_manager_params)

    respond_to do |format|
      if @student_success_manager.save
        format.html { redirect_to @student_success_manager, notice: 'Student success manager was successfully created.' }
        format.json { render :show, status: :created, location: @student_success_manager }
      else
        format.html { render :new }
        format.json { render json: @student_success_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_success_managers/1
  # PATCH/PUT /student_success_managers/1.json
  def update
    respond_to do |format|
      if @student_success_manager.update(student_success_manager_params)
        format.html { redirect_to @student_success_manager, notice: 'Student success manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_success_manager }
      else
        format.html { render :edit }
        format.json { render json: @student_success_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_success_managers/1
  # DELETE /student_success_managers/1.json
  def destroy
    @student_success_manager.destroy
    respond_to do |format|
      format.html { redirect_to student_success_managers_url, notice: 'Student success manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_success_manager
      @student_success_manager = StudentSuccessManager.find(params[:id])
    end

    def set_universities
      @universities = University.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_success_manager_params
      params.require(:student_success_manager).permit(:university_id, :ss, :ss_email)
    end
end
