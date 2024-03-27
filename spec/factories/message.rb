# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    sender factory: %i[user]
    receiver factory: %i[user]
    content { Faker::Lorem.sentence }
    read { false }
  end
end
