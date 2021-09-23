class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :set_time_zone, if: :user_signed_in?

  protect_from_forgery with: :exception, prepend: true

  DEVISE_SIGN_UP_FIELDS = %i[name email bio avatar speciality password  password_confirmation]
  DEVISE_UPDATE_FIELDS = %i[name email bio avatar speciality category video mentor current_password]

  def after_sign_out_path_for(user)
    new_user_session_path
  end

  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(DEVISE_SIGN_UP_FIELDS)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(DEVISE_UPDATE_FIELDS)}
  end

  private
  def set_time_zone
      #Time.zone = current_user.time_zone
  end
  def is_advisor!
    if !current_user.advisor?
      flash[:danger]= "Vous n'avez pas acces !"
      redirect_to components_dashboard_path
    end
  end
  def is_mentor!
    if !current_user.mentor?
      flash[:danger]= "Vous n'avez pas acces !"
      redirect_to components_dashboard_path
    end
  end

end
