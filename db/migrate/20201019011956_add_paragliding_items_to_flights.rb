class AddParaglidingItemsToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :distance, :float
  end
end
