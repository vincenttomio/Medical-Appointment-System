Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  # Área do paciente
  get 'patient/appointments', to: 'paciente/appointments#index', as: :patient_appointments

  # Área do médico
  namespace :medico do
    resources :appointments, except: [:show] 
  end
  
  # Sintomas
  resources :symptoms, only: [:index, :new, :create, :destroy]
end