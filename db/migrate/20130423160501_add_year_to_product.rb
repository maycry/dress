class AddYearToProduct < ActiveRecord::Migration
  def change
    add_column :products, :year, :integer
  end
end
