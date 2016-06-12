class AddBrandToProduct < ActiveRecord::Migration
  def change
    create_table :products_brands, id: false do |t|
      add_reference :products, :brand, index: true, foreign_key: true
    end
  end
end
