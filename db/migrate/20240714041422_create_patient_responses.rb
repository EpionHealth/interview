class CreatePatientResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :patient_responses do |t|
      t.references :patient_screening, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.references :answer_option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
