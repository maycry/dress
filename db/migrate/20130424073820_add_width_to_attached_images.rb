class AddWidthToAttachedImages < ActiveRecord::Migration
  def change
    add_column :attached_images, :width, :integer
  end
end
