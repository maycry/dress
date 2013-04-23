class AddYearToProducts < ActiveRecord::Migration
  def change
    add_column :products, :year, :integer
  end
end
