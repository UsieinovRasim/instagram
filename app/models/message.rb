# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :replies, class_name: 'Message', foreign_key: 'parent_message_id', dependent: :destroy

  validates :sender, :receiver, :content, presence: true
end
