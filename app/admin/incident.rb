ActiveAdmin.register Incident do
  permit_params :date, :description

  menu parent: 'Routes'

  index do
    selectable_column
    id_column
    column :date
    column :description
    actions
  end

  filter :date
  filter :description

  form do |f|
    f.inputs "Incident Details" do
      f.input :date
      f.input :description
    end
    f.actions
  end

end
