class StaticController < ApplicationController
  def index
    if current_user.present? and current_user.is_doctor?
      redirect_to doctor_patients_path(current_user.id)
    elsif current_user.present? and !current_user.is_doctor?
      redirect_to doctor_patient_readings_path(current_user.doctor.id, current_user.id)
    end
  end
end
