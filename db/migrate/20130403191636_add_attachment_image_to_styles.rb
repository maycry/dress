class AddAttachmentImageToStyles < ActiveRecord::Migration
  def self.up
    change_table :styles do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :styles, :image
  end
end
