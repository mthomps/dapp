class SessionsController < ApplicationController
  def new
  end

  def create
    user = Doctor.find_by_email(params[:email])
    user = Patient.find_by_email(params[:email]) unless user
    if user && user.authenticate(params[:password])
      session[:email] = user.email
      if user.is_doctor?
        redirect_to doctor_patients_url(user.id)
      else
        redirect_to doctor_patient_readings_url(user.doctor.id, user.id)
      end
    else
      flash.now[:error] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:email] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
