# frozen_string_literal: true

require_relative 'registry'

Schemas::Registry.schema('parrots.cud', 1) do
  required('name').value(:str?)
  required('role').value(included_in?: %w[worker manager admin accountant])
  required('id').value(:str?)
  required('status').value(included_in?: %w[created deleted updated])
end
