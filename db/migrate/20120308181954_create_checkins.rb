class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :user_id
      t.integer :adventure_id
      t.integer :checkpoint_id
      t.integer :venue_id

      t.timestamps
    end
  end
end
