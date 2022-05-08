# frozen_string_literal: true

require 'jwt'

module Parrots
  class JwtToken < String
    # @param [Parrot] parrot
    def initialize(parrot)
      token = OpenSSL::PKey::RSA.new(ENV['AUTH_SECRET_KEY'])

      super(JWT.encode(parrot_payload(parrot), token, 'RS256'))
    end

    def parrot_payload(parrot)
      {
        public_id: parrot.public_id,
        name: parrot.name,
        role: parrot.role,
        expires_in: 10.minutes.since.utc.to_i
      }
    end
  end
end
