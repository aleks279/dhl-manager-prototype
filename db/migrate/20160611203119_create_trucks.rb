class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :plate_number
      t.integer :year
      t.string :model
      t.float :weight_capacity

      t.timestamps null: false
    end
  end
end
