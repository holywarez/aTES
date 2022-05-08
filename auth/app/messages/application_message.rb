# frozen_string_literal: true

class ApplicationMessage < Hash
  # @param [ApplicationMessage] message
  def self.deliver(message)
    producer = WaterDrop::Producer.new do |config|
      config.deliver = true
      config.kafka = {
        'bootstrap.servers': ENV['MESSAGE_BROKER']
      }
    end

    producer.produce_sync(message)
    producer.close
  end

  def initialize
    super()
    update(
      topic: topic,
      payload: JSON.dump(payload)
    )
  end

  # @mandatory
  # @return [String]
  def topic
    raise NotImplementedError
  end

  # @mandatory
  # @return [Hash<String,String>]
  def payload
    raise NotImplementedError
  end
end
