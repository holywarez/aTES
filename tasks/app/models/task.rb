class Task < ApplicationRecord
  scope :active, -> { where(status: 'active') }

  has_one :assignee, class_name: 'Parrot', foreign_key: :public_id, primary_key: :assignee_public_id

  after_commit :notify_assigned, if: :assignee_public_id_previously_changed?
  after_commit :notify_resolved, if: :resolved_previously?
  after_create_commit :notify_created
  after_update_commit :notify_updated
  after_destroy_commit :notify_destroyed

  def notify_assigned
    ApplicationMessage.deliver(Tasks::AssignedMessage.new(self))
  end

  def notify_resolved
    ApplicationMessage.deliver(Tasks::ResolvedMessage.new(self))
  end

  def notify_updated
    ApplicationMessage.deliver(Tasks::UpdatedMessage.new(self))
  end

  def notify_created
    ApplicationMessage.deliver(Tasks::RegisteredMessage.new(self))
  end

  def notify_destroyed
    ApplicationMessage.deliver(Tasks::DeletedMessage.new(self))
  end

  def resolved_previously?
    status == 'resolved' && status_previously_changed?
  end
end
