ActiveAdmin.register Brand do
  permit_params :name

  menu parent: 'Product'

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :name

  form do |f|
    f.inputs "Brand Details" do
      f.input :name
    end
    f.actions
  end

end
