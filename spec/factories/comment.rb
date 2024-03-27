# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    text { 'Some comment content' }
    post
    user
  end
end
