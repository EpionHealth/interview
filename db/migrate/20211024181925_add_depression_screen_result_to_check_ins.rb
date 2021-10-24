class AddDepressionScreenResultToCheckIns < ActiveRecord::Migration[6.1]
  def change
    add_column :check_ins, :depression_screen_result, :string
  end
end
