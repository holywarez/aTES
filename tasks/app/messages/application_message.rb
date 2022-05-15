# frozen_string_literal: true

class ApplicationMessage < Hash
  # @param [ApplicationMessage] message
  def self.deliver(message)
    WaterDrop::SyncProducer.call(message[:payload], { topic: message[:topic] })
  rescue WaterDrop::Errors::InvalidMessageOptions
    Rails.logger.debug(message.inspect)
    raise
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
