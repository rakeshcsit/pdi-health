class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    
    if current_user.role == 'patient'
      location = inrs_path
    elsif current_user.role == 'doctor'
      location = doctor_dashboard_path
    elsif current_user.role == 'field_rep'
      location = patients_path
    elsif current_user.role == 'staff'
      location = patients_path
    elsif current_user.role == 'admin'
      location = patients_path
    end

    respond_with resource, location: location
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
