# frozen_string_literal: true

module Tasks
  class ResolveTask
    # @param [Task] task
    def self.call(task)
      task.update(status: 'resolved')
    end
  end
end
