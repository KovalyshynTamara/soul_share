class Event < ApplicationRecord
  belongs_to :created_by, class_name: "User", required: true
  belongs_to :location, optional: true
  has_many :event_participants
  has_many :event_songs
  has_many :songs, through: :event_songs
  has_many :comments, through: :event_participants

  validates :created_by, presence: true
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
end
