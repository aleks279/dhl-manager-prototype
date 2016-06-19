class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :plate_number
      t.integer :year
      t.string :model
      t.float :weight_capacity
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6

      t.timestamps null: false
    end
  end
end
