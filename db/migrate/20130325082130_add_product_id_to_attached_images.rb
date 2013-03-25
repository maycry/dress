class AddProductIdToAttachedImages < ActiveRecord::Migration
  def change
    add_column :attached_images, :product_id, :integer
  end
end
