FactoryBot.define do
  factory :events_click, class: "Events::Click", parent: :event do
    link { create(:link) } # rubocop:disable FactoryBot/FactoryAssociationWithStrategy

    remote_ip { Faker::Internet.ip_v4_address }
    user_agent { Faker::Internet.user_agent }
    referer { Faker::Internet.url }
    utm_source { Faker::Internet.domain_name }
  end
end
