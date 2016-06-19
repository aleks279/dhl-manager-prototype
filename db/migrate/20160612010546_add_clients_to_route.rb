class AddClientsToRoute < ActiveRecord::Migration
  def change
    create_table :routes_clients, id: false do |t|
      add_reference :clients, :route, index: true, foreign_key: true
    end
  end
end
