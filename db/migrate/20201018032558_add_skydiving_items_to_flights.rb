class AddSkydivingItemsToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :serial, :integer
    add_column :flights, :freefall, :integer
    add_column :flights, :launch_altitude, :integer
  end
end
