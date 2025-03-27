class RenameAddedByColumnInSongs < ActiveRecord::Migration[8.0]
  def change
    rename_column :songs, :added_by, :added_by_id
  end
end
