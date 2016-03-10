class AddAttachmentPhotoToAccessories < ActiveRecord::Migration
  def self.up
    change_table :accessories do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :accessories, :photo
  end
end
