# frozen_string_literal: true

module Parrots
  class JwtPayload < ActiveSupport::HashWithIndifferentAccess
    def initialize(jwt_token)
      token = OpenSSL::PKey::RSA.new(ENV['AUTH_PUBLIC_KEY'])
      payload, = JWT.decode(jwt_token, token, true, algorithms: ['RS256'])
      super(payload)
    end
  end
end
