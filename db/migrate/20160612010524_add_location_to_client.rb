class AddLocationToClient < ActiveRecord::Migration
  def change
    create_table :clients_locations, id: false do |t|
      add_reference :clients, :location, index: true, foreign_key: true
    end
  end
end
