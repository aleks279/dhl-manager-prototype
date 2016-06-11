class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :last_name
      t.string :address
      t.string :email
      t.string :phone
      t.string :identity_card_number

      t.timestamps null: false
    end
  end
end
