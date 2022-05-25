class SetNotNullUsersFields < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :name, false
    change_column_null :users, :email, false
    change_column_null :users, :is_verified, false, false
    change_column_null :users, :password, false
  end
end