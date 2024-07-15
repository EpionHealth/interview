class CreateAnswerOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :answer_options do |t|
      t.references :question, null: false, foreign_key: true
      t.text :description
      t.integer :value
      t.integer :order

      t.timestamps
    end
  end
end
