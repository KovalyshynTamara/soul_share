class AddEventParticipantToComments < ActiveRecord::Migration[8.0]
  def change
    add_reference :comments, :event_participant, null: false, foreign_key: true
  end
end
