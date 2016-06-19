class AddRouteIdToClient < ActiveRecord::Migration
  def change
    add_column :clients, :route_id, :integer
  end
end
