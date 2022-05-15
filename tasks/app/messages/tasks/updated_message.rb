# frozen_string_literal: true

module Tasks
  class UpdatedMessage < Tasks::TaskMessage
    def event
      'updated'
    end

    def payload
      super.merge(name: @task.name)
    end
  end
end
