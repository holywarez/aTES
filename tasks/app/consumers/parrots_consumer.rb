# frozen_string_literal: true

class ParrotsConsumer < ApplicationConsumer
  def consume
    params_batch.each do |message|
      event = Parrots::CudEvent.new(message.payload)
      case event.status
      when :deleted
        parrot = Parrot.find_by(public_id: event.public_id)
        parrot.destroy if parrot.present?
      else
        parrot = Parrot.find_or_create_by(public_id: event.public_id)
        parrot.update(name: event.name, role: event.role)
      end
    end
  end
end
