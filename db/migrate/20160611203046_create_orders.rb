class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :origin_country
      t.decimal :price

      t.timestamps null: false
    end
  end
end
