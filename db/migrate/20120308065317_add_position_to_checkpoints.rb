class AddPositionToCheckpoints < ActiveRecord::Migration
  def change
    add_column :checkpoints, :position, :integer
  end
end
