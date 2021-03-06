class Doctors::PatientsController < ApplicationController
  # GET /patients
  # GET /patients.json
  before_filter :load_doctor

  def load_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def index
    @patients = Patient.where(doctor_id: @doctor.id)

    if params[:sort_by].present?
      case params[:sort_by]
      when 'last_name'
        @patients = @patients.all.sort do |p1, p2|
          return 0 if p2.blank? or p1.blank?
          p1.name.split(' ').last.downcase <=> p2.name.split(' ').last.downcase
        end
      when 'weekly_average'
        @patients = @patients.all.sort do |p1, p2|
          return 0 if p2.blank? or p1.blank?
          p2.weekly_avg_bg <=> p1.weekly_avg_bg
        end
      when 'monthly_average'
        @patients = @patients.all.sort do |p1, p2|
          return 0 if p2.blank? or p1.blank?
          p2.monthly_avg_bg <=> p1.monthly_avg_bg
        end
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient = Patient.find(params[:id])
    redirect_to doctor_patient_readings_path(@doctor.id, @patient.id)
  end

  # GET /patients/new
  # GET /patients/new.json
  def new
    @patient = Patient.new
    @patient.time_settings.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    @patient.doctor = @doctor
    respond_to do |format|
      if @patient.save
        format.html { redirect_to doctor_patients_path, notice: 'Patient was successfully created.' }
        format.json { render json: @patient, status: :created, location: @patient }
      else
        format.html { render action: "new" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.json
  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end

  private

  def patient_params
    params[:patient].permit(:carb_ratio, :email, :name, :password, :password_confirmation,
      :phone_number, :age, :time_settings_attributes, :readings, :insulin_time)
  end
end
