require "rspec/expectations"

module DefineJsonAttributeMatcher
  extend RSpec::Matchers::DSL

  matcher :define_json_attribute do |field, value|
    match do |record|
      value ||= "value"

      record.send "#{field}=", value

      record.send(:data)[field.to_s] == value && record.send(field) == record.send(:data)[field.to_s]
    end

    description do
      "validate :#{field} as a json field on :data"
    end

    failure_message do
      <<~ERR
        expected field :#{field} to be stored on :data JSON attr
      ERR
    end
  end
end

RSpec.configure do |config|
  config.include DefineJsonAttributeMatcher, type: :model
end
