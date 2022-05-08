# frozen_string_literal: true

module Parrots
  class UpdatedMessage < CudMessage
    def status
      :updated
    end
  end
end
