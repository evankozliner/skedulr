class AddColumnToManager < ActiveRecord::Migration[5.0]
  def change
    add_column :managers, :managers_employee_id, :integer
  end
end
