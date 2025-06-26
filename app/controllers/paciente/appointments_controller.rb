module Paciente
  class AppointmentsController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_patient

    def index
      @patient = current_user.patient_profile
      @appointments = @patient.appointments.includes(:doctor, :symptoms).order(datetime: :asc)
    end

    private

    def ensure_patient
      unless current_user.patient?
        redirect_to root_path, alert: 'Acesso não autorizado'
      end
    end
  end
end