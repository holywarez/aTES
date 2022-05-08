# frozen_string_literal: true

module Parrots
  class DeletedMessage < Parrots::CudMessage
    def status
      :deleted
    end
  end
end
