class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :prompt
      t.references :screener, foreign_key: true

      t.timestamps
    end
  end
end
