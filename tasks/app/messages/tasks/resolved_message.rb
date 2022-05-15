# frozen_string_literal: true

module Tasks
  class ResolvedMessage < Tasks::TaskMessage
    def event
      'resolved'
    end
  end
end
