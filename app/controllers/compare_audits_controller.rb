class CompareAuditsController < ApplicationController
  before_action :set_audits, only: [:compare_choose]
  before_action :set_instructors, only: [:compare_choose]
  before_action :set_lps, only: [:compare_choose]
  before_filter :authenticate_user!
  before_action :check_if_admin, only: [:compare_choose]

  def compare_choose
  end

  private
    def set_instructors
      @instructors = Instructor.all
    end

    def set_lps
      @lesson_plans = LessonPlan.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_audits
      @audits = Audit.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audit_params
      params.require(:audit).permit(:audit_id_one, :audit_id_two)
    end
end
