class AddHeightToAttachedImages < ActiveRecord::Migration
  def change
    add_column :attached_images, :height, :integer
  end
end
