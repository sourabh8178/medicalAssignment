class DoctorsController < ApplicationController
  before_action :require_user

  def dashboard
    @patients_by_day = Patient.group_by_day(:created_at).count
    @patients = Patient.all
  end
end
