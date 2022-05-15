# frozen_string_literal: true

module Tasks
  class ShuffleTasks
    def self.call
      parrot_uuids = Parrot.pluck(:public_id)
      Task.active.find_each do |task|
        assignee_uuid = parrot_uuids.sample
        Tasks::AssignTask.call(task, assignee_uuid)
      end
    end
  end
end
