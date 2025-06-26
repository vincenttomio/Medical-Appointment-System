class CreatePatients < ActiveRecord::Migration[8.0]
  def change
    create_table :patients do |t|
      t.string :cpf
      t.date :birth_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
