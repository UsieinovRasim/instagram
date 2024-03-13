class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  followability

  has_many :posts
  # has_many :likes
  has_many :comments
  has_one_attached :avatar

  validates :website, length: { maximum: 250 }
  validates :about_myself, length: { maximum: 150 }

  GENDER_OPTIONS = {
    "Женский": "female",
    "Мужской": "male",
    "Предпочитаю не указывать": "unspecified"
  }.freeze

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end

  def self.ransackable_attributes(_)
    %w[email fullname username website]
  end
end
