class Doctors::Patients::ReadingsController < ApplicationController
  before_filter :load_patient

  def load_patient
    @patient = Patient.find(params[:patient_id])
    @doctor = @patient.doctor
  end

  def index
    @readings = Reading.where(patient_id: @patient.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patients }
    end
  end

  # TODO: Maybe respond with detailed json for ajax?
  # def show
  #   @reading = Reading.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @patient }
  #   end
  # end

  def new
    @reading = Reading.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

  # def edit
  #   @reading = Reading.find(params[:id])
  # end

  def create
    if params[:reading].present?
      reading_attrs = params[:reading]
    else
      reading_attrs =
      {
        blood_glucose: params[:blood_glucose],
        insulin: params[:insulin],
        exercised: params[:exercised] == '1',
        notes: params[:notes],
        carbs: params[:carbs],
        patient_id: params[:patient_id]
      }
    end

    @reading = Reading.new(reading_attrs)
    @reading.patient = @patient
    respond_to do |format|
      if @reading.save
        format.html { redirect_to doctor_patient_readings_path, notice: 'Reading was successfully created.' }
        format.json { render json: @patient, status: :created, location: @patient }
      else
        format.html { render action: "new" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @reading = Reading.find(params[:id])

    respond_to do |format|
      if @reading.update_attributes(params[:patient])
        format.html { redirect_to @reading, notice: 'Reading was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reading.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reading = Reading.find(params[:id])
    @reading.destroy

    respond_to do |format|
      format.html { redirect_to doctors_patients_readings_url }
      format.json { head :no_content }
    end
  end
end
