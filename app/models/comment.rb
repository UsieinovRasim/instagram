# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post

  def user
    User.find_by(id: user_id)
  end
end
