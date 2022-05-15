# frozen_string_literal: true

class ApplicationMessage < Hash
  # @param [ApplicationMessage] message
  def self.deliver(message)
    WaterDrop::AsyncProducer.call(
      JSON.dump(message),
      { topic: message[:topic] }
    )
  rescue WaterDrop::Errors::InvalidMessageOptions
    Rails.logger.debug(message.inspect)
    raise
  end

  def initialize
    super()
    update(
      topic: topic,
      event: event,
      event_version: event_version,
      payload: payload
    )
  end

  def event_version
    1
  end

  # @mandatory
  # @return [String]
  def event
    raise NotImplementedError
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
