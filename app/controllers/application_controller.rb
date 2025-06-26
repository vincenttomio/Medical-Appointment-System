class ApplicationController < ActionController::Base
  before_action :log_user_info

  private

  def log_user_info
    if user_signed_in?
      Rails.logger.info "Usuário logado: #{current_user.email} (ID: #{current_user.id}, Role: #{current_user.role})"
      Rails.logger.info "Perfil médico: #{current_user.doctor_profile.inspect}" if current_user.doctor?
      Rails.logger.info "Perfil paciente: #{current_user.patient_profile.inspect}" if current_user.patient?
    end
  end
end