class Song < ApplicationRecord
  belongs_to :added_by, class_name: "User", foreign_key: "added_by_id"
  has_many :event_songs
  has_many :events, through: :event_songs
  has_many :favorites, dependent: :destroy
  has_many :ratings, dependent: :destroy

  def average_rating
    ratings.average(:rating)&.round(1)
  end

  validates :title, presence: true, length: { maximum: 255 }
  validates :author, presence: true, length: { maximum: 255 }
end
