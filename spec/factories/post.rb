# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    description { 'Sample description' }
    user factory: %i[user]
  end
end
