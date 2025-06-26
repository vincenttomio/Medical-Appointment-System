class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  has_many :appointment_symptoms, dependent: :destroy
  has_many :symptoms, through: :appointment_symptoms
end