FactoryBot.define do
  factory :link_configuration do
    link

    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    image { fixture_file_upload("image.jpg", "image/jpeg") }
  end
end
