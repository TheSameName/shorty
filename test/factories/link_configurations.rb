FactoryBot.define do
  factory :link_configuration do
    link

    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    image { Faker::Internet.url }
  end
end
