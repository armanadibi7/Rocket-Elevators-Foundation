class AddBatteryToColumns < ActiveRecord::Migration[5.2]
  def change
    add_reference :columns, :column, foreign_key: true
  end
end
