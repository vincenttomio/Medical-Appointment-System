class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.doctor?
        redirect_to medico_appointments_path
      else
        redirect_to patient_appointments_path
      end
    else
      redirect_to new_user_session_path
    end
  end
end