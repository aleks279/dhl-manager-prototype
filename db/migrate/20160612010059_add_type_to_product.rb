class AddTypeToProduct < ActiveRecord::Migration
  def change
    create_table :products_type, id: false do |t|
      add_reference :products, :type, index: true, foreign_key: true
    end
  end
end
