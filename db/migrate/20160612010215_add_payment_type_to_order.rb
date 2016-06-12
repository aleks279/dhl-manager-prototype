class AddPaymentTypeToOrder < ActiveRecord::Migration
  def change
    create_table :orders_payment_types, id: false do |t|
      add_reference :orders, :payment_type, index: true, foreign_key: true
    end
  end
end
