class CreatePatientsResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :patients_responses do |t|
      t.references :patient_screening, null: false, foreign_key: true
      t.string :answer_value

      t.timestamps
    end
  end
end
