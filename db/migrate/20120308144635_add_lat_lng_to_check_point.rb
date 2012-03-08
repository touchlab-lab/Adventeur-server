class AddLatLngToCheckPoint < ActiveRecord::Migration
  def change
    add_column :checkpoints, :latitude, :decimal
    add_column :checkpoints, :longitude, :decimal
  end
end
