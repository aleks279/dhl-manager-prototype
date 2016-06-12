ActiveAdmin.register Driver do
  permit_params :name, :last_name, :address, :phone, :identity_card_number

  menu parent: 'Routes'

  index do
    selectable_column
    id_column
    column :name
    column :last_name
    column :address
    column :phone
    column :identity_card_number
    actions
  end

  filter :name
  filter :last_name
  filter :phone
  filter :identity_card_number

  form do |f|
    f.inputs "Driver Details" do
      f.input :name
      f.input :last_name
      f.input :phone
      f.input :address
      f.input :identity_card_number
    end
    f.actions
  end

end
