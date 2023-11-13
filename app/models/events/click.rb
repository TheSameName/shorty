module Events
  class Click < ::Event
    belongs_to :link, class_name: "::Link", foreign_key: :owner_id, inverse_of: :clicks

    json_attribute :remote_ip # TODO: Anonymize-it!
    json_attribute :user_agent
    json_attribute :referer
    json_attribute :utm_source
  end
end
