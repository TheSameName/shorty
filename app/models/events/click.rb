module Events
  class Click < ::Event
    # @mimic belongs_to :link
    alias_attribute :link, :owner
    alias_attribute :link_id, :owner_id

    json_attribute :remote_ip # TODO: Anonymize-it!
    json_attribute :user_agent
    json_attribute :referer
    json_attribute :utm_source
  end
end
