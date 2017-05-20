class RemoveColumnFromManager < ActiveRecord::Migration[5.0]
  def change
    remove_column :managers, :managers_employee_id, :integer
  end
end
