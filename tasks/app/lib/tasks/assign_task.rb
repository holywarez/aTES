# frozen_string_literal: true

module Tasks
  class AssignTask
    def self.call(task, assignee_public_id)
      Task.transaction do
        task.update(assignee_public_id: assignee_public_id)
      end

      ApplicationMessage.deliver(Tasks::AssignedMessage.new(@task))
    end
  end
end
