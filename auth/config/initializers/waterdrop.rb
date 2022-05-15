# frozen_string_literal: true

WaterDrop.setup do |config|
  config.deliver = true
  config.kafka.seed_brokers = ["kafka://#{ENV['MESSAGE_BROKER']}"]
end
