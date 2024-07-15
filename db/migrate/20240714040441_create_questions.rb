class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.references :screening_type, null: false, foreign_key: true
      t.text :description
      t.integer :order

      t.timestamps
    end
  end
end
