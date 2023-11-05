FactoryBot.define do
  factory :link_configuration do
    link

    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    image do
      Rack::Test::UploadedFile.new(
        Rails.root.join("spec/fixtures/files/image.jpg"), "image/jpeg"
      )
    end
  end
end
