class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :songs, foreign_key: "added_by_id"
  has_many :events, foreign_key: :created_by_id, class_name: "Event"
  has_many :favorites
  has_many :ratings
  has_many :event_participants
  has_many :comments, through: :event_participants

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
end
