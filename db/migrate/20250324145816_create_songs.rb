class CreateSongs < ActiveRecord::Migration[8.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :author
      t.text :lyrics
      t.text :chords
      t.string :genre
      t.float :rating
      t.integer :added_by

      t.timestamps
    end
  end
end
