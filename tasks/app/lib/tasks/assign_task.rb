# frozen_string_literal: true

module Tasks
  class AssignTask
    def self.call(task, assignee_public_id)
      task.update(assignee_public_id: assignee_public_id)
    end
  end
end
