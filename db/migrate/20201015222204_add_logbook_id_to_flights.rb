class AddLogbookIdToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :logbook_id, :integer
  end
end
