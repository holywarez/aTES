# frozen_string_literal: true

module Parrots
  class Description
    # @param [Parrots::JwtPayload] payload
    def initialize(payload)
      @payload = payload
    end

    def role
      @payload['role']
    end

    def name
      @payload['name'].presence || 'Noname'
    end

    def public_id
      @payload['public_id']
    end

    def manager?
      role == 'manager'
    end

    def admin?
      role =='admin'
    end

    def worker?
      role == 'worker'
    end
  end
end
