ActiveAdmin.register Client do
  permit_params :name, :email, :phone, :location, :schedule

  menu parent: 'Routes'

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :phone
    column 'Location' do |client|
      "Lat: #{client.latitude}, Long: #{client.longitude}"
    end
    # column 'Schedule', sortable: :schedule_id do |client|
    #   schedule = client.schedule
    #   "Available hours: #{schedule.start_time} to #{schedule.end_time}" + "\n" + "On: #{schedule.day}" if schedule
    # end
    actions
  end

  filter :name
  filter :email
  filter :phone

  form do |f|
    f.inputs "Client Details" do
      f.input :name
      f.input :email
      f.input :phone
      f.input :latitude
      t.input :longitude

    end
    f.actions
  end

end
