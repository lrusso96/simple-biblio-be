# frozen_string_literal: true

FactoryBot.define do
  sequence(:random_id) do |n|
    @random_ids ||= (1..100).to_a.shuffle
    @random_ids[n]
  end

  factory :ebook do
    title { Faker::Lorem.word }
    author { Faker::Name.last_name }

    provider
    rel_id { FactoryBot.generate(:random_id) }

    # lazy way to obtain "collisions" in provider_id
    after(:create) do |ebook|
      ebook.provider_id = 1 + (ebook.provider_id % 2)
    end
  end
end
