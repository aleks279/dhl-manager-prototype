class AddStateToDriver < ActiveRecord::Migration
  def change
    create_table :states_drivers, id: false do |t|
      t.belongs_to :states, index: true
      t.belongs_to :driver, index: true
    end
  end
end
