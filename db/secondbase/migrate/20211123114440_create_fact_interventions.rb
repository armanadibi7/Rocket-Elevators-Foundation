class CreateFactInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_interventions do |t|
      t.string :employee_id, null: false
      t.string :building_id, null: false
      t.string :battery_id
      t.string :column_id
      t.string :elevator_id
      t.datetime :intervention_start_time, null: false
      t.datetime :intervention_end_time
      t.string :result, null: false
      t.string :report
      t.string :status, null: false
    end
  end
end
