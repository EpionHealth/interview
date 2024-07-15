class AddReferenceAnswerOptions < ActiveRecord::Migration[6.1]
  def change
    change_table :answer_options do |t|
      t.references :screening_type
    end
  end
end
