class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = %w[patient doctor].freeze
  validates :role, inclusion: { in: ROLES }

  has_one :patient_profile, class_name: 'Patient', dependent: :destroy
  has_one :doctor_profile, class_name: 'Doctor', dependent: :destroy

  # Garante que o perfil sempre exista
  def patient_profile
    super || build_patient_profile(cpf: 'CPF não informado', birth_date: Date.today).tap do |p|
      p.save!(validate: false)
    end
  end

  def doctor_profile
    super || build_doctor_profile(specialty: 'Clínico Geral').tap do |d|
      d.save!(validate: false)
    end
  end

  def patient?
    role == 'patient'
  end

  def doctor?
    role == 'doctor'
  end
end