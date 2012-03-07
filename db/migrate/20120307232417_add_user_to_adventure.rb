class AddUserToAdventure < ActiveRecord::Migration
  def change
    add_column :adventures, :user_id, :integer
  end
end
