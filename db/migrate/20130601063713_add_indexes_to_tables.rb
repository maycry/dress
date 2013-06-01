class AddIndexesToTables < ActiveRecord::Migration
  def self.up
  	add_index :attached_images, :product_id
  end

  def self.down
  	remove_index :attached_images, :product_id
  end
end
