# frozen_string_literal: true

module Tasks
  class DeletedMessage < Tasks::TaskMessage
    def event
      'deleted'
    end
  end
end
