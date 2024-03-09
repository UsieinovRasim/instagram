class User < ApplicationRecord
  has_many :posts
  has_one_attached :avatar

  GENDER_OPTIONS = {
    "Женский": "female",
    "Мужской": "male",
    "Предпочитаю не указывать": "unspecified"
  }.freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :website, length: { maximum: 250 }
  validates :about_myself, length: { maximum: 150 }
end
