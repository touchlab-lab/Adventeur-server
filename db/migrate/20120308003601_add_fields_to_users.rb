class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :foursq_token, :string
    add_column :users, :foursq_id, :integer
    add_column :users, :authentication_token, :string
  end
end
