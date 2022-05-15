class Task < ApplicationRecord
  scope :active, -> { where(status: 'active') }

  has_one :assignee, class_name: 'Parrot', foreign_key: :public_id, primary_key: :assignee_public_id
end
