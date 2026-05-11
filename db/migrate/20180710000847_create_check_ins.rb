class CreateCheckIns < ActiveRecord::Migration[5.2]
  def change
    create_table :check_ins do |t|
      t.string :patient_id, null: false
      t.timestamps
    end
  end
end

class AddPatientIdToCheckIns < ActiveRecord::Migration[5.2]
  def change
    add_column :check_ins, :patient_id, :integer, null: false, default: 1
  end
end