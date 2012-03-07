class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.integer :foursquare_id
      t.string :name
      t.string :address
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
