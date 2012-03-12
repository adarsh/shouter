class AddAttachmentPhotoToPhotoShout < ActiveRecord::Migration
  def self.up
    add_column :photo_shouts, :photo_file_name, :string
    add_column :photo_shouts, :photo_content_type, :string
    add_column :photo_shouts, :photo_file_size, :integer
    add_column :photo_shouts, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :photo_shouts, :photo_file_name
    remove_column :photo_shouts, :photo_content_type
    remove_column :photo_shouts, :photo_file_size
    remove_column :photo_shouts, :photo_updated_at
  end
end
