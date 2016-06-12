class AddOrderToWarehouse < ActiveRecord::Migration
  def change
    create_table :orders_warehouses, id: false do |t|
      t.belongs_to :orders, index: true
      t.belongs_to :warehouse, index: true
    end
  end
end
