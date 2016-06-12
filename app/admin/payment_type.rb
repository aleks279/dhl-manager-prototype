ActiveAdmin.register PaymentType do
  permit_params :name, :payment_deadline

  menu parent: 'Warehouses'

  index do
    selectable_column
    id_column
    column :name
    column :payment_deadline
    actions
  end

  filter :name

  form do |f|
    f.inputs "Payment Type Details" do
      f.input :name
      f.input :payment_deadline
    end
    f.actions
  end

end
