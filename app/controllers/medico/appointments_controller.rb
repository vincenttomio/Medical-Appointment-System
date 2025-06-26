module Medico
  class AppointmentsController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_doctor
    before_action :set_doctor
    # Remova :show da lista de ações para set_appointment
    before_action :set_appointment, only: [:edit, :update, :destroy]

    def index
      @appointments = @doctor.appointments.includes(:patient, :symptoms).order(datetime: :asc)
    end

    def new
      @appointment = @doctor.appointments.new
    end

    def create
      @appointment = @doctor.appointments.new(appointment_params)
      
      if @appointment.save
        redirect_to medico_appointments_path, notice: 'Consulta agendada com sucesso!'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @appointment.update(appointment_params)
        redirect_to medico_appointments_path, notice: 'Consulta atualizada com sucesso!'
      else
        render :edit
      end
    end

    def destroy
      @appointment.destroy
      redirect_to medico_appointments_path, notice: 'Consulta cancelada com sucesso!'
    end

    private

    def ensure_doctor
      unless current_user.doctor?
        redirect_to root_path, alert: 'Acesso não autorizado'
      end
    end

    def set_doctor
      @doctor = current_user.doctor_profile
    end

    def set_appointment
      @appointment = @doctor.appointments.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:datetime, :patient_id, symptom_ids: [])
    end
  end
end