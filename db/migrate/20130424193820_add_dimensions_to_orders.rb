class AddDimensionsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :dimensions, :text
  end
end
