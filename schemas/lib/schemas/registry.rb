# frozen_string_literal: true

module Schemas
  class Registry
    RegistryError = Class.new(StandardError)
    NoSchemaFound = Class.new(Schemas::Registry::RegistryError)
    ValidationFailed = Class.new(Schemas::Registry::RegistryError)

    def self.register(event, version = 1, &block)
      @@store ||= {}
      @@store[event] ||= {}
      @@store[event][version] = Dry::Schema.JSON(&block)
    end

    def self.validate(data, event, version = 1)
      schema(event, version).call(data)
    end

    def self.schema(event, version)
      raise Schemas::Registry::NoSchemaFound unless @@store[event]
      raise Schemas::Registry::NoSchemaFound unless @@store[event][version]

      @@store[event][version]
    end
  end
end
