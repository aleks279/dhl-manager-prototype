class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
