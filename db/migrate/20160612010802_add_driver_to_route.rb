class AddDriverToRoute < ActiveRecord::Migration
  def change
    create_table :routes_drivers, id: false do |t|
      t.belongs_to :drivers, index: true
      t.belongs_to :route, index: true
    end
  end
end
