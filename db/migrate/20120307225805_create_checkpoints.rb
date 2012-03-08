class CreateCheckpoints < ActiveRecord::Migration
  def change
    create_table :checkpoints do |t|
      t.string :tout
      t.integer :venue_id
      t.text :description

      t.timestamps
    end
  end
end
