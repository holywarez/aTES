# frozen_string_literal: true

module Parrots
  class DescriptionPolicy
    attr_reader :parrot, :target

    def initialize(parrot, target)
      # @type [Parrots::Description]
      @parrot = parrot
      @target = target
    end

    def shuffle?
      @parrot.manager? || @parrot.admin?
    end
  end
end
