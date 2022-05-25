class AddDefaultValueToIsNullUsersField < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :is_verified, :boolean, :default => false
  end
end
