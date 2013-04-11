class AddOriginalToAttachedImage < ActiveRecord::Migration
  def change
    add_column :attached_images, :replica, :boolean, :default => false
  end
end
