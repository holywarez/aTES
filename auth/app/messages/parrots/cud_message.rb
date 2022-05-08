# frozen_string_literal: true

module Parrots
  class CudMessage < ApplicationMessage
    # @param [Parrot] parrot
    def initialize(parrot)
      @parrot = parrot
      super()
    end

    def topic
      'parrots'
    end

    def payload
      {
        id: @parrot.public_id,
        name: @parrot.name,
        role: @parrot.role,
        status: status
      }
    end

    # @mandatory
    # @return [Symbol,String]
    def status
      raise NotImplementedError
    end
  end
end
