# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.username }
    fullname { Faker::Name.name }
    password { 'password' }
  end
end
