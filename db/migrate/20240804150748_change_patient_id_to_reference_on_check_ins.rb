class ChangePatientIdToReferenceOnCheckIns < ActiveRecord::Migration[6.1]
  def change
    change_column :check_ins, :patient_id, :integer, references: :patient, foreign_key: true, using: "patient_id::integer"
  end
end
