class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    return @current_user if @current_user.present?
    user = Doctor.find_by_email(session[:email])
    user = Patient.find_by_email(session[:email]) unless user
    @current_user = user
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: 'Not Authorized' if current_user.blank?
  end

end
