class CreateAnswerTable < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.bigint :question_id, null: false
      t.string :title, null: false
      t.references :check_in, null: false, foreign_key: true

      t.timestamps
    end
  end
end
