class AddScheduleToClient < ActiveRecord::Migration
  def change
    create_table :clients_schedule, id: false do |t|
      add_reference :clients, :schedule, index: true, foreign_key: true
    end
  end
end
