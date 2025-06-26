class CreateAppointmentSymptoms < ActiveRecord::Migration[8.0]
  def change
    create_table :appointment_symptoms do |t|
      t.references :appointment, null: false, foreign_key: true
      t.references :symptom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
