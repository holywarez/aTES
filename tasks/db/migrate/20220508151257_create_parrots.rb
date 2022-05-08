class CreateParrots < ActiveRecord::Migration[6.1]
  def change
    create_table :parrots do |t|
      t.string :name
      t.uuid :public_id, null: false
      t.string :role

      t.timestamps
    end
  end
end
