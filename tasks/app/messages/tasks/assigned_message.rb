# frozen_string_literal: true

module Tasks
  class AssignedMessage < Tasks::TaskMessage
    def event
      'assigned'
    end
  end
end
