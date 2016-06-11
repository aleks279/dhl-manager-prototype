class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.time :start_time
      t.time :end_time
      t.date :day

      t.timestamps null: false
    end
  end
end
