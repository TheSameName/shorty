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

  def self.where_data(**data)
    scope = all

    data.each do |name, value|
      arel_data_column =
        Arel::Nodes::InfixOperation.new(
          "->>",
          arel_table[:data],
          Arel::Nodes.build_quoted(name)
        )

      condition = case
                  when value.is_a?(Array) then arel_data_column.in(value.map(&:to_s))
                  when value.nil?         then arel_data_column.eq(nil)
                  else
                    arel_data_column.eq(value.to_s)
                  end

      scope = scope.where condition
    end

    scope
  end

end
