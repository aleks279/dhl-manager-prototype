class AddStateToTruck < ActiveRecord::Migration
  def change
    create_table :states_trucks, id: false do |t|
      t.belongs_to :states, index: true
      t.belongs_to :truck, index: true
    end
  end
end
