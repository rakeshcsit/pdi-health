class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  around_action :set_time_zone, if: :current_user

  def check_if_admin
    if user_signed_in?
      redirect_to root_path unless current_user.admin?
    else
      redirect_to root_path
    end
  end

  def set_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end

  # def set_time_zone
  #   Time.zone = current_user.time_zone
  # end
end
