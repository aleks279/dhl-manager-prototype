class AddUserToDriver < ActiveRecord::Migration
  def change
    add_reference :users, :driver, index: true, foreign_key: true
  end
end
