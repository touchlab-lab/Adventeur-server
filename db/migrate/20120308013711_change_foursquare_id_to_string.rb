class ChangeFoursquareIdToString < ActiveRecord::Migration
  def up
    change_column :venues, :foursquare_id, :string
  end

  def down
  end
end
