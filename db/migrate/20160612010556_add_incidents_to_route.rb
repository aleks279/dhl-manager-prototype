class AddIncidentsToRoute < ActiveRecord::Migration
  def change
    create_table :routes_incidents, id: false do |t|
      t.belongs_to :incidents, index: true
      t.belongs_to :route, index: true
    end
  end
end
