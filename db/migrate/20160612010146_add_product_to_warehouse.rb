class AddProductToWarehouse < ActiveRecord::Migration
  def change
    create_table :products_warehouses, id: false do |t|
      t.belongs_to :products, index: true
      t.belongs_to :warehouse, index: true
    end
  end
end
