class AddCategoryToProduct < ActiveRecord::Migration
  def change
    create_table :products_category, id: false do |t|
      add_reference :products, :category, index: true, foreign_key: true
    end
  end
end
