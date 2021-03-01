class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.date :man_year
      t.string :make, limit: 50
      t.string :model, limit: 50
      t.string :sub_model, limit: 50
      t.string :engine, limit: 50
      t.string :notes, limit: 150

      t.timestamps
    end
  end
end
