class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :maiden_name
      t.integer :age
      t.string :gender
      t.string :email
      t.string :phone
      t.string :username
      t.string :birth_date

      t.timestamps
    end
  end
end
