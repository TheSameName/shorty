FactoryBot.define do
  factory :account do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 12) }

    verified { true }

    trait :unverified do
      verified { false }
    end
  end
end
