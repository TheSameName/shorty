FactoryBot.define do
  factory :link do
    url { Faker::Internet.url host: "example.local", scheme: "https" }
  end
end
