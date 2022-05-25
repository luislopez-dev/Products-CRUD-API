class SetNotNullItemsFields < ActiveRecord::Migration[7.0]
  def change
    change_column_null :items, :name, false
    change_column_null :items, :qty, false
    change_column_null :items, :descr, false
    change_column_null :items, :price, false
  end
end
