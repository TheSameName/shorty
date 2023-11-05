module Events
  class Click < ::Event
    # @ belongs_to :link
    alias_attribute :link, :owner
    alias_attribute :link_id, :owner_id

    json_attribute :remote_ip # TODO: Anonymize-it!
    json_attribute :user_agent
    json_attribute :referer # TODO: The referrer is not always set, so we need alternative ways

    # json_attribute :utm_source
    # json_attribute :utm_medium
    # json_attribute :utm_campaign
    # json_attribute :utm_term
    # json_attribute :utm_content
  end
end
