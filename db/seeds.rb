# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Limpar dados existentes
[AppointmentSymptom, Appointment, Symptom, Patient, Doctor, User].each do |model|
  model.destroy_all
end

# Criar médico
doctor_user = User.create!(
  email: 'medico@exemplo.com',
  password: 'senha123',
  name: 'Dr. Silva',
  role: 'doctor'
)

# Criar perfil médico (deve ser criado automaticamente, mas garantimos)
Doctor.find_or_create_by!(
  user: doctor_user,
  specialty: 'Clínico Geral'
)

# Criar paciente
patient_user = User.create!(
  email: 'paciente@exemplo.com',
  password: 'senha123',
  name: 'João da Silva',
  role: 'patient'
)

# Criar perfil paciente
Patient.find_or_create_by!(
  user: patient_user,
  cpf: '123.456.789-00',
  birth_date: '1990-01-01'
)

# Criar sintomas
symptoms = Symptom.create!([
  { name: 'Febre' }, { name: 'Tosse' }, { name: 'Dor de cabeça' }
])

# Criar sintomas se não existirem
symptoms_data = [
  { name: 'Febre' },
  { name: 'Tosse' },
  { name: 'Dor de cabeça' },
  { name: 'Dor abdominal' },
  { name: 'Náusea' }
]

symptoms_data.each do |symptom_attrs|
  Symptom.find_or_create_by!(symptom_attrs)
end

# Criar consulta
appointment = Appointment.create!(
  doctor: doctor_user.doctor_profile,
  patient: patient_user.patient_profile,
  datetime: Time.current + 1.day
)

# Associar sintomas
appointment.symptoms << Symptom.first(2)

puts "Seed completo!"
puts "Seed executado com sucesso!"
puts "Médico: email: medico@exemplo.com / senha: senha123"
puts "Paciente: email: paciente@exemplo.com / senha: senha123"