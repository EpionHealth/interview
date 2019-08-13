class AddScoreToCheckIns < ActiveRecord::Migration[5.2]
  def change
    add_column :check_ins, :score, :integer
  end
end
