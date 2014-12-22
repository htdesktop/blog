class RenamePostIdForImage < ActiveRecord::Migration
  def change
    rename_column :images, :post_id, :imageable_id 
    add_column :images, :imageable_type, :string
  end
end
