class StudentFeedbacksController < ApplicationController
  before_action :set_student_feedback, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_action :check_if_admin, only: [:new, :edit, :create, :update, :destroy]

  # GET /student_feedbacks
  # GET /student_feedbacks.json
  def index
    @student_feedbacks = StudentFeedback.all
  end

  # GET /student_feedbacks/1
  # GET /student_feedbacks/1.json
  def show
  end

  # GET /student_feedbacks/new
  def new
    @student_feedback = StudentFeedback.new
  end

  # GET /student_feedbacks/1/edit
  def edit
  end

  # POST /student_feedbacks
  # POST /student_feedbacks.json
  def create
    @student_feedback = StudentFeedback.new(rd_params)

    respond_to do |format|
      if @student_feedback.save
        format.html { redirect_to @student_feedback, notice: 'Student Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @student_feedback }
      else
        format.html { render :new }
        format.json { render json: @student_feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_feedbacks/1
  # PATCH/PUT /student_feedbacks/1.json
  def update
    respond_to do |format|
      if @student_feedback.update(rd_params)
        format.html { redirect_to @student_feedback, notice: 'Student Feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_feedback }
      else
        format.html { render :edit }
        format.json { render json: @student_feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_feedbacks/1
  # DELETE /student_feedbacks/1.json
  def destroy
    @student_feedback.destroy
    respond_to do |format|
      format.html { redirect_to student_feedbacks_url, notice: 'Student Feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_student_feedback
      @student_feedback = StudentFeedback.find(params[:id])
    end

    def student_feedback_params
      params.require(:student_feedback).permit(:class_code, :week, :student_name, :how_class_week, :pace, :acad_supp, :new_learn, :mastery, :inst_engag, :inst_clarity, :inst_know, :hours_outside, :spend_time_on, :pace_notes, :support_notes, :inst_notes, :add_notes)
    end
end
