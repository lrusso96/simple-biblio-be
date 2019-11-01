# frozen_string_literal: true

FactoryBot.define do
  factory :provider do
    name { Faker::FunnyName.two_word_name }
  end
end