class UpdateCheckIns < ActiveRecord::Migration[6.1]
  def change
    change_table :check_ins do |t|
      t.remove :patient_id
      t.references :patient, null: false, foreign_key: true
    end
  end
end
