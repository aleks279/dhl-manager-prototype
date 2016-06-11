class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.datetime :date
      t.string :description

      t.timestamps null: false
    end
  end
end
