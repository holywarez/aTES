class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.uuid :task_public_id, null: false, default: 'gen_random_uuid()'
      t.string :name, null: false
      t.uuid :assignee_public_id, null: false
      t.string :status, null: false, default: 'active'

      t.timestamps
    end
  end
end
