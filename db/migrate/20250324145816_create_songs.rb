class CreateSongs < ActiveRecord::Migration[8.0]
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.text :lyrics
      t.text :chords
      t.string :genre
      t.float :rating
      t.references :added_by, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
