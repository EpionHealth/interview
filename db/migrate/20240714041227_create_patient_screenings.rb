class CreatePatientScreenings < ActiveRecord::Migration[6.1]
  def change
    create_table :patient_screenings do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :screening_type, null: false, foreign_key: true
      t.date :screening_date
      t.integer :total_score

      t.timestamps
    end
  end
end
