class User < ApplicationRecord
  has_many :songs, foreign_key: "added_by_id"
  has_many :events, foreign_key: :created_by_id, class_name: "Event"
  has_many :favorites, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :event_participants
  has_many :comments, through: :event_participants

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
end
