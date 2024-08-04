class CreateCheckInScreeners < ActiveRecord::Migration[6.1]
  def change
    create_table :check_in_screeners do |t|
      t.string :status, default: "ready", null: false
      t.references :check_in, foreign_key: true
      t.references :screener, foreign_key: true

      t.timestamps
    end
  end
end
