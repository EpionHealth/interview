class CreateUserTable < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :maiden_name
      t.string :email, null: false, uniqness: true
      t.string :phone

      t.timestamps
    end
  end
end
