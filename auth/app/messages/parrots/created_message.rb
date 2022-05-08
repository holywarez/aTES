# frozen_string_literal: true

module Parrots
  class CreatedMessage < Parrots::CudMessage
    def status
      :created
    end
  end
end
