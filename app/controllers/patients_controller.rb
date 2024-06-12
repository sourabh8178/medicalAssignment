class PatientsController < ApplicationController
  before_action :set_patient, only: %i[edit update destroy show]
  before_action :require_user
  before_action :require_receptionist, only: %i[new create edit update destroy]

  def index
    @patients = current_user.receptionist? ? current_user.patients : Patient.all
  end

  def new
    @patient = Patient.new
  end

  def show
    @patient
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.receptionist = current_user if current_user.receptionist?
    if @patient.save
      redirect_to patients_path, notice: 'Patient registered successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path, notice: 'Patient details updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path, notice: 'Patient deleted successfully.'
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :age, :gender, :address, :phone_number)
  end
end
