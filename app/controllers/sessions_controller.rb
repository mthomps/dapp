class SessionsController < ApplicationController
  def new
  end

  def create
    user = Doctor.find_by_email(params[:email])
    user = Patient.find_by_email(params[:email]) unless user
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.is_doctor?
        redirect_to doctor_url(user.id)
      else
        redirect_to doctor_patient_url(user.doctor.id, user.id)
      end
    else
      flash.now[:error] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
