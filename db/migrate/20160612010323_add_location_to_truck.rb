class AddLocationToTruck < ActiveRecord::Migration
  def change
    create_table :trucks_locations, id: false do |t|
      add_reference :trucks, :location, index: true, foreign_key: true
    end
  end
end
