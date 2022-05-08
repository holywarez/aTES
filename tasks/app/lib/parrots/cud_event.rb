# frozen_string_literal: true

module Parrots
  class CudEvent
    def initialize(payload)
      Rails.logger.fatal(payload.inspect)
      @payload = payload
    end

    def status
      @payload['status'].to_sym
    end

    def name
      @payload['name']
    end

    def public_id
      @payload['id']
    end

    def role
      @payload['role']
    end
  end
end
