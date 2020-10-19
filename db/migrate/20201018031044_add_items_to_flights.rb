class AddItemsToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :location, :string
    add_column :flights, :launch_type, :string
  end
end
