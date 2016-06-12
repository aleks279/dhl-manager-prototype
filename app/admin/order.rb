ActiveAdmin.register Order do
  permit_params :origin_country, :payment_type

  menu parent: 'Warehouses'

  index do
    selectable_column
    id_column
    column :origin_country
    column :price
    column 'Payment Type', sortable: :payment_type_id do |order|
      type = oder.payment_type
      payment_type.name if payment_type
    end
    actions
  end

  filter :origin_country

  form do |f|
    f.inputs "Order Details" do
      f.input :origin_country
      f.input :description
      f.input :payment_type, label: 'Payment Type', collection: PaymentType.all
    end
    f.actions
  end

end
