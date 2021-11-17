class AddLatLongToElevators < ActiveRecord::Migration[5.2]
  def change
    add_column :elevators, :lat, :float
    add_column :elevators, :long, :float
  end
end
