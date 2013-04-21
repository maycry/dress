class AddProductNameToTypes < ActiveRecord::Migration
  def change
    add_column :types, :productname, :string
  end
end
