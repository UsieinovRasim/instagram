# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_many :likes

  validates :description, presence: true
end
