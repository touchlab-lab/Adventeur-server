class AddAdventureIdToCheckpoints < ActiveRecord::Migration
  def change
    add_column :checkpoints, :adventure_id, :integer
  end
end
