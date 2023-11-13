# STI Class for events
class Event < ApplicationRecord
  belongs_to :owner, polymorphic: true, optional: true

  validates :type, presence: true
  validates :data, presence: true

  # Mimic active record attributes
  # json_attribute :name
  # Event.new(name: 'test').name
  # => 'test'
  def self.json_attribute(*json_attributes)
    json_attributes.each do |json_attribute|
      attribute_string = json_attribute.to_s

      define_method(json_attribute) { data[attribute_string] }
      define_method("#{json_attribute}=") { |val| data[attribute_string] = val }
    end
  end

  # TODO: Query json attributes
  # Event.where(name: 'test')
end
