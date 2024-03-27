# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :text, presence: true

  def user
    User.find_by(id: user_id)
  end
end
