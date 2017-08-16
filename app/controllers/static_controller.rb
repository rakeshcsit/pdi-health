class StaticController < ApplicationController
  before_action :set_permissions_doctor, only: [:doctor_dashboard]

  def doctor_dashboard
    @patients = current_user.doctor.patients

  end

  private
    def set_permissions_doctor
      if user_signed_in?
        unless current_user.doctor?
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    end

end