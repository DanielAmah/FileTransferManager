class AddIndexToChecksum < ActiveRecord::Migration[5.2]
  def change
    add_index :active_storage_blobs, :checksum, :unique => true
  end
end
