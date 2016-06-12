class AddClientsToRoute < ActiveRecord::Migration
  def change
    create_table :routes_clients, id: false do |t|
      t.belongs_to :clients, index: true
      t.belongs_to :route, index: true
    end
  end
end
