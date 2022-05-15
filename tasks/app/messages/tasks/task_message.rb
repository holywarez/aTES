# frozen_string_literal: true

module Tasks
  class TaskMessage < ApplicationMessage
    # @param [Task] task
    def initialize(task)
      # @type [Task]
      @task = task
    end

    def topic
      'tasks_lifecycle'
    end

    def event
      raise NotImplementedError
    end

    def payload
      {
        event: event,
        task_public_id: @task.task_public_id,
        assignee_public_id: @task.assignee_public_id,
      }
    end
  end
end
