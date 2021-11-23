class CreateFactInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_interventions do |t|
      t.string :employee_id
      t.string :building_id
      t.string :battery_id
      t.string :column_id
      t.string :elevator_id
      t.datetime :intervention_start_time
      t.datetime :intervention_end_time
      t.string :result
      t.text :report
      t.string :status
    end
  end
end
