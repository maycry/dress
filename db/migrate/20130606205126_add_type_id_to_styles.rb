class AddTypeIdToStyles < ActiveRecord::Migration
  def change
    add_column :styles, :type_id, :integer
  end
end
