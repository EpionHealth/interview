class RemoveReferenceAnswerOptions < ActiveRecord::Migration[6.1]
  def change
    change_table :answer_options do |t|
      t.remove_references :question
    end
  end
end
