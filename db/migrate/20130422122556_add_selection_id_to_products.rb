class AddSelectionIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :selection_id, :integer
  end
end
