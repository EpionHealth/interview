class AddReferencePatientScreening < ActiveRecord::Migration[6.1]
  def change
    change_table :patient_screenings do |t|
      t.references :check_in, null: false, foreign_key: true
    end
  end
end
