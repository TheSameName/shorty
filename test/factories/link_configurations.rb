FactoryBot.define do
  factory :link_configuration do
    link

    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    image { Rack::Test::UploadedFile.new(Rails.root.join("test/support/assets/image.jpg"), "image/jpeg") }
  end
end
