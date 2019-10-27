# frozen_string_literal: true

FactoryBot.define do
  factory :ebook do
    title { Faker::Lorem.word }
  end
end