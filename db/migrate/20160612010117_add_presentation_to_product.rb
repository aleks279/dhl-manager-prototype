class AddPresentationToProduct < ActiveRecord::Migration
  def change
    create_table :products_presentations, id: false do |t|
      add_reference :products, :presentation, index: true, foreign_key: true
    end
  end
end
