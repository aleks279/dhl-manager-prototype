class AddTruckToRoute < ActiveRecord::Migration
  def change
    create_table :routes_trucks, id: false do |t|
      t.belongs_to :trucks, index: true
      t.belongs_to :route, index: true
    end
  end
end
