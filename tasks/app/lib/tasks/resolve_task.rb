# frozen_string_literal: true

module Tasks
  class ResolveTask
    # @param [Task] task
    def self.call(task)
      Task.transaction do
        task.update(status: 'resolved')
      end
      ApplicationMessage.deliver(Tasks::ResolvedMessage.new(task))
    end
  end
end
