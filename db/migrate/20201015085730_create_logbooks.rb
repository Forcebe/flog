class CreateLogbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :logbooks do |t|
      t.text :name
      t.text :aviation_type

      t.timestamps
    end
  end
end
