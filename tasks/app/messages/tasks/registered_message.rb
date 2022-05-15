# frozen_string_literal: true

module Tasks
  class RegisteredMessage < Tasks::TaskMessage
    def event
      'registered'
    end

    def payload
      super.merge(name: @task.name)
    end
  end
end
