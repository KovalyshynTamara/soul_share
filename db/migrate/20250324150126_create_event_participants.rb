class CreateEventParticipants < ActiveRecord::Migration[8.0]
  def change
    create_table :event_participants do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :role
      t.boolean :is_private
      t.boolean :is_commenting_disabled
      t.string :user_name
      t.string :event_name

      t.timestamps
    end
  end
end
