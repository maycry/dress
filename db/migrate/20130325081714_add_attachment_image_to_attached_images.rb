class AddAttachmentImageToAttachedImages < ActiveRecord::Migration
  def self.up
    change_table :attached_images do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :attached_images, :image
  end
end
