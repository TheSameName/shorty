# STI Class for events
class Event < ApplicationRecord
  belongs_to :owner, polymorphic: true, optional: true

  validates :type, presence: true
  validates :data, presence: true

  # Mimic active record attributes
  # json_attribute :name
  # Event.new(name: 'test').name
  # => 'test'
  def self.json_attribute(*attributes)
    attributes.each do |attribute|
      attribute_string = attribute.to_s

      define_method(attribute) { data[attribute_string] }
      define_method("#{attribute}=") { |val| data[attribute_string] = val }
    end
  end

  # TODO: Query json attributes
  # Event.where(name: 'test')
end
