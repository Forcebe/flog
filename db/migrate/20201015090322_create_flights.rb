class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.date :date
      t.text :aircraft
      t.text :registration
      t.boolean :night
      t.boolean :multi
      t.boolean :command
      t.float :flight_time
      t.float :instrument_time
      t.text :notes

      t.timestamps
    end
  end
end
