class Symptom < ApplicationRecord
  has_many :appointment_symptoms, dependent: :destroy
  has_many :appointments, through: :appointment_symptoms
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end