# frozen_string_literal: true

require_relative 'registry'

Schemas::Registry.schema('tasks.registered', 1) do
  required(:name).value(:str?)
  required(:task_public_id).value(:str?)
  required(:assignee_public_id).value(:str?)
end

Schemas::Registry.schema('tasks.assigned', 1) do
  required(:task_public_id).value(:str?)
  required(:assignee_public_id).value(:str?)
end

Schemas::Registry.schema('tasks.deleted', 1) do
  required(:task_public_id).value(:str?)
  required(:assignee_public_id).value(:str?)
end

Schemas::Registry.schema('tasks.updated', 1) do
  required(:name).value(:str?)
  required(:task_public_id).value(:str?)
  required(:assignee_public_id).value(:str?)
end

Schemas::Registry.schema('tasks.resolved', 1) do
  required(:task_public_id).value(:str?)
  required(:assignee_public_id).value(:str?)
end