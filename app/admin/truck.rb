ActiveAdmin.register Truck do
  permit_params :plate_number, :year, :model, :weight_capacity, :location

  menu parent: 'Routes'

  index do
    selectable_column
    id_column
    column :plate_number
    column :year
    column :model
    column :weight_capacity
    column 'Location', sortable: :location_id do |truck|
      location = truck.location
      "#{location.latitude}, #{location.longitude}" if location
    end
    actions
  end

  filter :plate_number
  filter :year
  filter :model
  filter :weight_capacity

  form do |f|
    f.inputs "Driver Details" do
      f.input :plate_number
      f.input :year
      f.input :model
      f.input :weight_capacity
    end
    f.actions
  end

end
