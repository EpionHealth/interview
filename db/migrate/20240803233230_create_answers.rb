class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.integer :choice, null: false
      t.references :check_in, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
